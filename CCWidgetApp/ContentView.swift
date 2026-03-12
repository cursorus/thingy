import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<kWidgetCount, id: \.self) { index in
                NavigationLink(destination: WidgetEditorView(index: index)) {
                    WidgetRowView(index: index)
                }
            }
            .navigationTitle("Виджеты CC")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Row в списке

struct WidgetRowView: View {
    let index: Int
    @State private var config: WidgetConfig = .defaultConfig(index: 0)

    var body: some View {
        HStack(spacing: 14) {
            // Превью иконки
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(config.isOn ? config.colorOn.color : config.colorOff.color)
                    .frame(width: 44, height: 44)
                Image(systemName: config.isOn ? config.symbolOn : config.symbolOff)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(config.label)
                    .font(.body.weight(.medium))
                Text(config.isOn ? config.labelOn : config.labelOff)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text("#\(index + 1)")
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 4)
        .onAppear { config = UserDefaults.appGroup.loadConfig(index: index) }
    }
}
