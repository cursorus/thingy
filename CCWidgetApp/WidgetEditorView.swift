import SwiftUI
import WidgetKit

struct WidgetEditorView: View {
    let index: Int
    @State private var config: WidgetConfig = .defaultConfig(index: 0)
    @State private var showSymbolPicker = false
    @State private var pickingFor: SymbolTarget = .on

    enum SymbolTarget { case on, off }

    var body: some View {
        Form {
            // ── Превью ──────────────────────────────────────────────────
            Section {
                HStack {
                    Spacer()
                    WidgetPreviewCard(config: config)
                    Spacer()
                }
            }
            .listRowBackground(Color.clear)

            // ── Название ────────────────────────────────────────────────
            Section("Название") {
                TextField("Виджет", text: $config.label)
                TextField("Текст когда ВКЛ", text: $config.labelOn)
                TextField("Текст когда ВЫКЛ", text: $config.labelOff)
            }

            // ── Иконки ──────────────────────────────────────────────────
            Section("SF Symbol") {
                HStack {
                    Text("Включён")
                    Spacer()
                    Button {
                        pickingFor = .on
                        showSymbolPicker = true
                    } label: {
                        HStack {
                            Image(systemName: config.symbolOn)
                            Text(config.symbolOn)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                HStack {
                    Text("Выключен")
                    Spacer()
                    Button {
                        pickingFor = .off
                        showSymbolPicker = true
                    } label: {
                        HStack {
                            Image(systemName: config.symbolOff)
                            Text(config.symbolOff)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }

            // ── Цвета ───────────────────────────────────────────────────
            Section("Цвет") {
                ColorPicker("Цвет включён", selection: Binding(
                    get: { config.colorOn.color },
                    set: { config.colorOn = CodableColor($0) }
                ))
                ColorPicker("Цвет выключен", selection: Binding(
                    get: { config.colorOff.color },
                    set: { config.colorOff = CodableColor($0) }
                ))
            }

            // ── Анимация ─────────────────────────────────────────────────
            Section("Анимация при нажатии") {
                Picker("Анимация", selection: $config.animation) {
                    ForEach(WidgetAnimation.allCases) { anim in
                        Text(anim.displayName).tag(anim)
                    }
                }
                .pickerStyle(.menu)
            }

            // ── Действие ─────────────────────────────────────────────────
            Section("Действие") {
                Picker("Действие", selection: $config.action) {
                    ForEach(WidgetAction.allCases) { act in
                        Text(act.displayName).tag(act)
                    }
                }
                .pickerStyle(.menu)

                if config.action == .openApp {
                    TextField("URL-схема (напр. instagram://)", text: $config.actionURL)
                        .keyboardType(.URL)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
            }

            // ── Текущее состояние ────────────────────────────────────────
            Section("Состояние") {
                Toggle("Сейчас включён", isOn: $config.isOn)
            }
        }
        .navigationTitle("Виджет #\(index + 1)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Сохранить") { save() }
                    .fontWeight(.semibold)
            }
        }
        .onAppear {
            config = UserDefaults.appGroup.loadConfig(index: index)
        }
        .sheet(isPresented: $showSymbolPicker) {
            SymbolPickerView { symbol in
                if pickingFor == .on { config.symbolOn = symbol }
                else { config.symbolOff = symbol }
                showSymbolPicker = false
            }
        }
    }

    private func save() {
        UserDefaults.appGroup.saveConfig(config, index: index)
        // Перезагружаем все виджеты
        WidgetCenter.shared.reloadAllTimelines()
    }
}

// MARK: - Превью карточка

struct WidgetPreviewCard: View {
    let config: WidgetConfig

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(config.isOn ? config.colorOn.color : config.colorOff.color)
                    .frame(width: 64, height: 64)
                Image(systemName: config.isOn ? config.symbolOn : config.symbolOff)
                    .font(.system(size: 28, weight: .medium))
                    .foregroundStyle(.white)
            }
            Text(config.isOn ? config.labelOn : config.labelOff)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding(12)
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 18))
    }
}

// MARK: - Пикер символов

struct SymbolPickerView: View {
    let onSelect: (String) -> Void

    // Популярные SF Symbols сгруппированные по теме
    let symbols: [String: [String]] = [
        "Общие": [
            "star.fill","star","heart.fill","heart","bolt.fill","bolt",
            "bell.fill","bell","moon.fill","moon","sun.max.fill","sun.min",
            "flame.fill","flame","drop.fill","drop","leaf.fill","leaf"
        ],
        "Технологии": [
            "wifi","wifi.slash","bluetooth","antenna.radiowaves.left.and.right",
            "iphone","ipad","macbook","tv","airpods","applewatch",
            "speaker.wave.3.fill","speaker.slash.fill","mic.fill","mic.slash.fill"
        ],
        "Интерфейс": [
            "house.fill","house","gear","gearshape.fill","slider.horizontal.3",
            "switch.2","toggle.on","toggle.off","checkmark.circle.fill",
            "xmark.circle.fill","plus.circle.fill","minus.circle.fill"
        ],
        "Транспорт": [
            "car.fill","car","bicycle","scooter","tram.fill",
            "airplane","ferry.fill","figure.walk","figure.run"
        ],
        "Медиа": [
            "play.fill","pause.fill","stop.fill","forward.fill","backward.fill",
            "music.note","headphones","camera.fill","photo.fill","video.fill"
        ],
        "Природа": [
            "cloud.fill","cloud.rain.fill","snow","wind","thermometer.sun.fill",
            "humidity.fill","tornado","rainbow"
        ]
    ]

    @State private var search = ""
    @Environment(\.dismiss) var dismiss

    var filteredGroups: [String: [String]] {
        if search.isEmpty { return symbols }
        let q = search.lowercased()
        var result: [String: [String]] = [:]
        for (group, syms) in symbols {
            let filtered = syms.filter { $0.contains(q) }
            if !filtered.isEmpty { result[group] = filtered }
        }
        return result
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(filteredGroups.keys.sorted(), id: \.self) { group in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(group)
                                .font(.headline)
                                .padding(.horizontal)

                            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 6), spacing: 12) {
                                ForEach(filteredGroups[group] ?? [], id: \.self) { sym in
                                    Button { onSelect(sym) } label: {
                                        VStack(spacing: 4) {
                                            Image(systemName: sym)
                                                .font(.system(size: 22))
                                                .frame(height: 28)
                                            Text(sym)
                                                .font(.system(size: 7))
                                                .lineLimit(1)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .background(.quaternary, in: RoundedRectangle(cornerRadius: 10))
                                    }
                                    .foregroundStyle(.primary)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .searchable(text: $search, prompt: "Поиск символа")
            .navigationTitle("Выбери иконку")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") { dismiss() }
                }
            }
        }
    }
}
