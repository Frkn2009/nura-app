# NURA AI Edge Function

Gerçek LLM bağlantısı için sunucu tarafı sınır. OpenAI uyumlu herhangi bir
sağlayıcıyı (`/v1/chat/completions`) kullanır; anahtar yalnızca sunucuda durur,
Flutter istemcisine asla sızmaz.

Üç eylem sunar (payload içindeki `action` ile seçilir):

| action     | Dönüş                                                    |
|------------|-----------------------------------------------------------|
| `feedback` | cümle geri bildirimi + 0-100 skor + ipuçları + teşvik     |
| `scenario` | seviyeye göre diyalog senaryosu + kelime listesi          |
| `summary`  | günlük hafıza raporu                                      |

## Güvenlik

- İstemcinin Supabase JWT'si doğrulanır (`Bearer` header).
- LLM anahtarı istemcide yoktur, yalnızca `OPENAI_API_KEY` env'de tutulur.
- İstek boyutları sunucuda sınırlanır (metinler kırpılır).

## İstemci tarafı düşüş

`lib/features/ai/data/supabase_ai_service.dart`, bu fonksiyonu çağırır. Ağ
hatası, anahtar eksikliği, timeout veya geçersiz yanıt durumunda otomatik olarak
offline `FakeAiService`'e düşer — kullanıcı asla boş ekran görmez.

## Deploy

```bash
supabase link --project-ref qkhmtmwfwyscvtveiwui
supabase secrets set OPENAI_API_KEY=YOUR_SERVER_SIDE_KEY
supabase functions deploy ai
```

Opsiyonel env değerleri:

- `OPENAI_BASE_URL` — varsayılan `https://api.openai.com/v1` (özel proxy /
  başka sağlayıcı için)
- `OPENAI_MODEL` — varsayılan `gpt-4o-mini`

Not: Supabase publishable key zaten `SupaConfig` içinde tanımlı olduğundan,
fonksiyon deploy edilir edilmez uygulama otomatik olarak gerçek AI'a geçer.
