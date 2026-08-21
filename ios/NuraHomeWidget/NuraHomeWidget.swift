import SwiftUI
import WidgetKit

private let appGroup = "group.com.nura.nura"

struct NuraEntry: TimelineEntry {
    let date: Date
    let lesson: String
    let dailyXp: Int
    let goal: Int
    let streak: Int
}

struct NuraProvider: TimelineProvider {
    func placeholder(in context: Context) -> NuraEntry {
        NuraEntry(date: Date(), lesson: "Bugünün pratiği", dailyXp: 40, goal: 100, streak: 3)
    }

    func getSnapshot(in context: Context, completion: @escaping (NuraEntry) -> Void) {
        completion(entry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<NuraEntry>) -> Void) {
        completion(Timeline(entries: [entry()], policy: .after(Date().addingTimeInterval(3600))))
    }

    private func entry() -> NuraEntry {
        let data = UserDefaults(suiteName: appGroup)
        return NuraEntry(
            date: Date(),
            lesson: data?.string(forKey: "lesson") ?? "Bugünün pratiği",
            dailyXp: data?.integer(forKey: "daily_xp") ?? 0,
            goal: data?.integer(forKey: "goal") ?? 100,
            streak: data?.integer(forKey: "streak") ?? 0
        )
    }
}

struct NuraWidgetView: View {
    let entry: NuraEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("NURA").font(.caption.bold()).tracking(2).foregroundStyle(Color(red: 0.88, green: 0.95, blue: 0.94))
            Spacer()
            Text(entry.lesson).font(.headline).foregroundStyle(.white).lineLimit(2)
            HStack {
                Text("\(entry.dailyXp) / \(entry.goal) XP").font(.caption.bold()).foregroundStyle(Color(red: 0.94, green: 0.70, blue: 0.56))
                Spacer()
                Text("\(entry.streak) gün").font(.caption).foregroundStyle(.white)
            }
        }
        .padding()
        .containerBackground(Color(red: 0.05, green: 0.35, blue: 0.33), for: .widget)
        .widgetURL(URL(string: "nura://app"))
    }
}

@main
struct NuraHomeWidget: Widget {
    let kind = "NuraHomeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: NuraProvider()) { entry in
            NuraWidgetView(entry: entry)
        }
        .configurationDisplayName("NURA Günlük Pratik")
        .description("Günlük dersini, XP hedefini ve serini gösterir.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
