import SwiftUI

@main
struct VersionHistoryLabApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

private struct DemoRelease: Identifiable {
    let id: String
    let releaseDate: String
    let minimumOS: String
    let note: String
}

struct ContentView: View {
    @State private var selectedRelease = "4.2"

    private let releases = [
        DemoRelease(id: "4.2", releaseDate: "Oct 2026", minimumOS: "OS 27.0 (demo)", note: "Example release with a refreshed layout."),
        DemoRelease(id: "4.1", releaseDate: "Aug 2026", minimumOS: "OS 26.0 (demo)", note: "Example release with accessibility improvements."),
        DemoRelease(id: "3.8", releaseDate: "May 2026", minimumOS: "OS 25.0 (demo)", note: "Example release with an offline reading mode.")
    ]

    private var current: DemoRelease {
        releases.first(where: { $0.id == selectedRelease }) ?? releases[0]
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    intro
                    targetCard
                    releaseList
                    explanation
                }
                .padding(20)
                .frame(maxWidth: 680)
                .frame(maxWidth: .infinity)
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Version History Lab")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(Color.indigo)
    }

    private var intro: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Explore version history")
                .font(.largeTitle.bold())
            Text("A safe, offline learning demo. Pick a fictional release and see its example compatibility notes.")
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding(.top, 8)
    }

    private var targetCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Practice scenario", systemImage: "graduationcap.fill")
                .font(.headline)
                .foregroundStyle(.indigo)
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Sample Reader")
                        .font(.title3.bold())
                    Text("Fictional app · local sample data")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Image(systemName: "book.closed.fill")
                    .font(.title2)
                    .foregroundStyle(.indigo)
                    .frame(width: 48, height: 48)
                    .background(Color.indigo.opacity(0.1), in: RoundedRectangle(cornerRadius: 14))
            }
            Divider()
            HStack {
                Text("Selected release")
                    .foregroundStyle(.secondary)
                Spacer()
                Text(current.id)
                    .fontWeight(.semibold)
            }
            HStack {
                Text("Example minimum OS")
                    .foregroundStyle(.secondary)
                Spacer()
                Text(current.minimumOS)
                    .fontWeight(.semibold)
            }
            Text(current.note)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.top, 2)
        }
        .padding(18)
        .background(.background, in: RoundedRectangle(cornerRadius: 20))
    }

    private var releaseList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Example release history")
                .font(.title2.bold())
            ForEach(releases) { release in
                Button {
                    selectedRelease = release.id
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: selectedRelease == release.id ? "checkmark.circle.fill" : "circle")
                            .font(.title2)
                            .foregroundStyle(selectedRelease == release.id ? .indigo : .secondary)
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Version \(release.id)")
                                .font(.headline)
                                .foregroundStyle(.primary)
                            Text("\(release.releaseDate) · \(release.minimumOS)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.caption.bold())
                            .foregroundStyle(.tertiary)
                    }
                    .padding(14)
                    .background(.background, in: RoundedRectangle(cornerRadius: 16))
                    .contentShape(RoundedRectangle(cornerRadius: 16))
                }
                .buttonStyle(.plain)
                .accessibilityHint("Shows sample compatibility notes for this fictional release")
            }
        }
    }

    private var explanation: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Learning only", systemImage: "info.circle.fill")
                .font(.headline)
                .foregroundStyle(.indigo)
            Text("This app uses invented sample records. It does not connect to an App Store, download or install software, change another app, or perform a downgrade. OS labels are illustrative and do not describe real compatibility.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.indigo.opacity(0.07), in: RoundedRectangle(cornerRadius: 16))
        .padding(.bottom, 12)
    }
}
