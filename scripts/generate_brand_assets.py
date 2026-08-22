#!/usr/bin/env python3
"""NURA marka varlıklarını tek kaynaktan üretir (telifsiz, özgün tasarım).

Geometri `lib/ui/brand.dart` içindeki `NuraMark` CustomPainter ile birebir
aynıdır: mint kare üzerinde beyaz N çizgisi + coral nokta. Uygulama ikonu,
splash ve web ikonları hep bu üreticiden çıkar; elle düzenlenmiş ikon dosyası
yoktur.

Kullanım:
    python3 scripts/generate_brand_assets.py

Gereksinim: Pillow  (pip install pillow)
"""
import os
from pathlib import Path

from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parent.parent

MINT = (13, 89, 85)    # Nura.mintDark  #0D5955
CORAL = (185, 84, 67)  # Nura.coral    #B95443
WHITE = (255, 255, 255)

# Brand.dart ile aynı oranlar.
_BG_RADIUS = 0.30
_STROKE = 0.105
_LEFT_X = 0.29
_RIGHT_X = 0.71
_TOP = 0.25
_BOTTOM = 0.75
_DOT_X = 0.78
_DOT_Y = 0.20
_DOT_R = 0.055


def draw_mark(size: int, transparent_corners: bool) -> Image.Image:
    """NURA işaretini `size`×`size` kare olarak çizer."""
    img = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    if transparent_corners:
        d.rounded_rectangle(
            [0, 0, size - 1, size - 1],
            radius=int(size * _BG_RADIUS),
            fill=MINT,
        )
    else:
        d.rectangle([0, 0, size - 1, size - 1], fill=MINT)

    stroke = size * _STROKE
    left_x = size * _LEFT_X
    right_x = size * _RIGHT_X
    top = size * _TOP
    bottom = size * _BOTTOM

    points = [
        (left_x, bottom),
        (left_x, top),
        (right_x, bottom),
        (right_x, top),
    ]
    d.line(points, fill=WHITE, width=int(stroke), joint="curve")
    # Yuvarlak uçlar (StrokeCap.round karşılığı).
    cap_r = stroke / 2
    for x, y in points:
        d.ellipse([x - cap_r, y - cap_r, x + cap_r, y + cap_r], fill=WHITE)

    dot_x = size * _DOT_X
    dot_y = size * _DOT_Y
    dot_r = size * _DOT_R
    d.ellipse(
        [dot_x - dot_r, dot_y - dot_r, dot_x + dot_r, dot_y + dot_r],
        fill=CORAL,
    )
    return img


def draw_splash(width: int, height: int | None = None) -> Image.Image:
    """Orman yeşili zemin üzerinde ortalanmış mark (launch splash)."""
    height = height or width
    img = Image.new("RGBA", (width, height), MINT)
    mark = draw_mark(int(min(width, height) * 0.42), transparent_corners=True)
    offset = ((width - mark.width) // 2, (height - mark.height) // 2)
    img.alpha_composite(mark, offset)
    return img


def save(img: Image.Image, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    img.save(path)
    print(f"  {path.relative_to(ROOT)} ({img.width}×{img.height})")


def main() -> None:
    print("==> NURA marka varlıkları üretiliyor")

    # --- Android legacy launcher ikonları (mipmap-*) -----------------------
    for dpi, size in [
        ("mdpi", 48),
        ("hdpi", 72),
        ("xhdpi", 96),
        ("xxhdpi", 144),
        ("xxxhdpi", 192),
    ]:
        save(
            draw_mark(size, transparent_corners=True),
            ROOT / f"android/app/src/main/res/mipmap-{dpi}/ic_launcher.png",
        )

    # --- Android launch splash logosu (drawable-nodpi) ---------------------
    save(
        draw_mark(512, transparent_corners=True),
        ROOT / "android/app/src/main/res/drawable-nodpi/launch_logo.png",
    )

    # --- iOS uygulama ikonları (Assets.xcassets/AppIcon.appiconset) --------
    ios_icons = [
        "Icon-App-20x20@1x.png",
        "Icon-App-20x20@2x.png",
        "Icon-App-20x20@3x.png",
        "Icon-App-29x29@1x.png",
        "Icon-App-29x29@2x.png",
        "Icon-App-29x29@3x.png",
        "Icon-App-40x40@1x.png",
        "Icon-App-40x40@2x.png",
        "Icon-App-40x40@3x.png",
        "Icon-App-60x60@2x.png",
        "Icon-App-60x60@3x.png",
        "Icon-App-76x76@1x.png",
        "Icon-App-76x76@2x.png",
        "Icon-App-83.5x83.5@2x.png",
        "Icon-App-1024x1024@1x.png",
    ]
    for name in ios_icons:
        point, scale = name.split("@")
        point_size = float(point.split("-")[-1].rstrip("x").split("x")[0])
        size = int(round(point_size * int(scale[0])))
        save(
            draw_mark(size, transparent_corners=False),
            ROOT / "ios/Runner/Assets.xcassets/AppIcon.appiconset" / name,
        )

    # --- iOS launch screen (LaunchImage.imageset) --------------------------
    # 168×185 pt — storyboard'da bildirilen boyut (logo ortalanır).
    for name, size in [
        ("LaunchImage.png", (168, 185)),
        ("LaunchImage@2x.png", (336, 370)),
        ("LaunchImage@3x.png", (504, 555)),
    ]:
        save(
            draw_splash(*size),
            ROOT / "ios/Runner/Assets.xcassets/LaunchImage.imageset" / name,
        )

    # --- Web ikonları --------------------------------------------------------
    for name in ["Icon-192.png", "Icon-512.png"]:
        size = int(name.split("-")[1].split(".")[0])
        save(draw_mark(size, transparent_corners=True), ROOT / "web/icons" / name)

    # Maskable: güvenli daire içine sığacak biçimde küçültülmüş mark.
    for name in ["Icon-maskable-192.png", "Icon-maskable-512.png"]:
        size = int(name.split("-")[2].split(".")[0])
        img = Image.new("RGBA", (size, size), MINT)
        mark = draw_mark(int(size * 0.56), transparent_corners=False)
        offset = (size - mark.width) // 2
        img.alpha_composite(mark, (offset, offset))
        save(img, ROOT / "web/icons" / name)

    for size in [16, 32, 48]:
        name = "favicon.png" if size == 48 else f"favicon-{size}.png"
        save(draw_mark(size, transparent_corners=True), ROOT / "web" / name)

    # --- Ortak splash logosu (flutter_native_splash + dokümantasyon) --------
    save(draw_splash(1024), ROOT / "assets/splash_logo.png")

    print("==> Tamam")


if __name__ == "__main__":
    main()
