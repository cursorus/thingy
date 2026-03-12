// AUTO-GENERATED — не редактируй вручную, используй generate_widgets.py
// Сгенерировано: 50 виджетов Control Center

import AppIntents
import ControlCenter
import SwiftUI
import WidgetKit

// MARK: - Toggle Intent (один на все виджеты, слот передаётся как параметр)

struct ToggleWidgetIntent: AppIntent {
    static let title: LocalizedStringResource = "Toggle CC Widget"
    static let isDiscoverable = false

    @Parameter(title: "Slot") var slot: Int

    init() { self.slot = 0 }
    init(slot: Int) { self.slot = slot }

    func perform() async throws -> some IntentResult {
        let defaults = UserDefaults.appGroup
        var config = defaults.loadConfig(index: slot)
        if config.action == .openApp, !config.actionURL.isEmpty,
           let url = URL(string: config.actionURL) {
            // openURL из extension не работает напрямую — используем openURL через environment
            // Сохраняем флаг, хост-приложение обработает при открытии
            defaults.set(config.actionURL, forKey: "pending_open_url")
        } else {
            config.isOn.toggle()
            defaults.saveConfig(config, index: slot)
        }
        ControlCenter.ControlCenterMutation.reloadControls(ofKind: widgetKind(slot))
        return .result()
    }
}

func widgetKind(_ index: Int) -> String {
    "com.example.ccwidgetapp.widget\(index)"
}

// MARK: - Generic Provider

struct SlotProvider: ControlValueProvider {
    let slot: Int
    var previewValue: Bool { false }
    func currentValue() async throws -> Bool {
        UserDefaults.appGroup.loadConfig(index: slot).isOn
    }
}

// MARK: - Shared view builder

@ViewBuilder
func widgetLabel(config: WidgetConfig, isOn: Bool) -> some View {
    let sym = isOn ? config.symbolOn : config.symbolOff
    let anim = config.animation
    Group {
        switch anim {
        case .wiggle:
            Image(systemName: sym).symbolEffect(.wiggle, options: .nonRepeating, value: isOn)
        case .bounce:
            Image(systemName: sym).symbolEffect(.bounce, options: .nonRepeating, value: isOn)
        case .pulse:
            Image(systemName: sym).symbolEffect(.pulse, options: .nonRepeating, value: isOn)
        case .rotate:
            Image(systemName: sym).symbolEffect(.rotate, options: .nonRepeating, value: isOn)
        case .none:
            Image(systemName: sym)
        }
    }
    Text(isOn ? config.labelOn : config.labelOff)
}

// MARK: - 50 ControlWidget structs

struct CCWidget0: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget0"
    private let slot = 0
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 1")
        .description("Настраиваемый виджет #1")
    }
}

struct CCWidget1: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget1"
    private let slot = 1
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 2")
        .description("Настраиваемый виджет #2")
    }
}

struct CCWidget2: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget2"
    private let slot = 2
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 3")
        .description("Настраиваемый виджет #3")
    }
}

struct CCWidget3: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget3"
    private let slot = 3
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 4")
        .description("Настраиваемый виджет #4")
    }
}

struct CCWidget4: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget4"
    private let slot = 4
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 5")
        .description("Настраиваемый виджет #5")
    }
}

struct CCWidget5: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget5"
    private let slot = 5
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 6")
        .description("Настраиваемый виджет #6")
    }
}

struct CCWidget6: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget6"
    private let slot = 6
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 7")
        .description("Настраиваемый виджет #7")
    }
}

struct CCWidget7: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget7"
    private let slot = 7
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 8")
        .description("Настраиваемый виджет #8")
    }
}

struct CCWidget8: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget8"
    private let slot = 8
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 9")
        .description("Настраиваемый виджет #9")
    }
}

struct CCWidget9: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget9"
    private let slot = 9
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 10")
        .description("Настраиваемый виджет #10")
    }
}

struct CCWidget10: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget10"
    private let slot = 10
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 11")
        .description("Настраиваемый виджет #11")
    }
}

struct CCWidget11: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget11"
    private let slot = 11
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 12")
        .description("Настраиваемый виджет #12")
    }
}

struct CCWidget12: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget12"
    private let slot = 12
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 13")
        .description("Настраиваемый виджет #13")
    }
}

struct CCWidget13: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget13"
    private let slot = 13
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 14")
        .description("Настраиваемый виджет #14")
    }
}

struct CCWidget14: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget14"
    private let slot = 14
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 15")
        .description("Настраиваемый виджет #15")
    }
}

struct CCWidget15: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget15"
    private let slot = 15
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 16")
        .description("Настраиваемый виджет #16")
    }
}

struct CCWidget16: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget16"
    private let slot = 16
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 17")
        .description("Настраиваемый виджет #17")
    }
}

struct CCWidget17: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget17"
    private let slot = 17
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 18")
        .description("Настраиваемый виджет #18")
    }
}

struct CCWidget18: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget18"
    private let slot = 18
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 19")
        .description("Настраиваемый виджет #19")
    }
}

struct CCWidget19: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget19"
    private let slot = 19
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 20")
        .description("Настраиваемый виджет #20")
    }
}

struct CCWidget20: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget20"
    private let slot = 20
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 21")
        .description("Настраиваемый виджет #21")
    }
}

struct CCWidget21: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget21"
    private let slot = 21
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 22")
        .description("Настраиваемый виджет #22")
    }
}

struct CCWidget22: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget22"
    private let slot = 22
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 23")
        .description("Настраиваемый виджет #23")
    }
}

struct CCWidget23: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget23"
    private let slot = 23
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 24")
        .description("Настраиваемый виджет #24")
    }
}

struct CCWidget24: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget24"
    private let slot = 24
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 25")
        .description("Настраиваемый виджет #25")
    }
}

struct CCWidget25: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget25"
    private let slot = 25
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 26")
        .description("Настраиваемый виджет #26")
    }
}

struct CCWidget26: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget26"
    private let slot = 26
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 27")
        .description("Настраиваемый виджет #27")
    }
}

struct CCWidget27: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget27"
    private let slot = 27
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 28")
        .description("Настраиваемый виджет #28")
    }
}

struct CCWidget28: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget28"
    private let slot = 28
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 29")
        .description("Настраиваемый виджет #29")
    }
}

struct CCWidget29: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget29"
    private let slot = 29
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 30")
        .description("Настраиваемый виджет #30")
    }
}

struct CCWidget30: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget30"
    private let slot = 30
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 31")
        .description("Настраиваемый виджет #31")
    }
}

struct CCWidget31: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget31"
    private let slot = 31
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 32")
        .description("Настраиваемый виджет #32")
    }
}

struct CCWidget32: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget32"
    private let slot = 32
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 33")
        .description("Настраиваемый виджет #33")
    }
}

struct CCWidget33: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget33"
    private let slot = 33
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 34")
        .description("Настраиваемый виджет #34")
    }
}

struct CCWidget34: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget34"
    private let slot = 34
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 35")
        .description("Настраиваемый виджет #35")
    }
}

struct CCWidget35: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget35"
    private let slot = 35
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 36")
        .description("Настраиваемый виджет #36")
    }
}

struct CCWidget36: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget36"
    private let slot = 36
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 37")
        .description("Настраиваемый виджет #37")
    }
}

struct CCWidget37: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget37"
    private let slot = 37
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 38")
        .description("Настраиваемый виджет #38")
    }
}

struct CCWidget38: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget38"
    private let slot = 38
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 39")
        .description("Настраиваемый виджет #39")
    }
}

struct CCWidget39: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget39"
    private let slot = 39
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 40")
        .description("Настраиваемый виджет #40")
    }
}

struct CCWidget40: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget40"
    private let slot = 40
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 41")
        .description("Настраиваемый виджет #41")
    }
}

struct CCWidget41: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget41"
    private let slot = 41
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 42")
        .description("Настраиваемый виджет #42")
    }
}

struct CCWidget42: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget42"
    private let slot = 42
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 43")
        .description("Настраиваемый виджет #43")
    }
}

struct CCWidget43: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget43"
    private let slot = 43
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 44")
        .description("Настраиваемый виджет #44")
    }
}

struct CCWidget44: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget44"
    private let slot = 44
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 45")
        .description("Настраиваемый виджет #45")
    }
}

struct CCWidget45: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget45"
    private let slot = 45
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 46")
        .description("Настраиваемый виджет #46")
    }
}

struct CCWidget46: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget46"
    private let slot = 46
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 47")
        .description("Настраиваемый виджет #47")
    }
}

struct CCWidget47: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget47"
    private let slot = 47
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 48")
        .description("Настраиваемый виджет #48")
    }
}

struct CCWidget48: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget48"
    private let slot = 48
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 49")
        .description("Настраиваемый виджет #49")
    }
}

struct CCWidget49: ControlWidget {
    static let kind = "com.example.ccwidgetapp.widget49"
    private let slot = 49
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) { isOn in
            let cfg = UserDefaults.appGroup.loadConfig(index: slot)
            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {
                widgetLabel(config: cfg, isOn: isOn)
            }
            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)
        }
        .displayName("Виджет 50")
        .description("Настраиваемый виджет #50")
    }
}

// MARK: - Extension entry point (регистрируем все 50)

@main
struct CCWidgetsBundle: ControlWidgetBundle {
    var body: some ControlWidget {
        CCWidget0()
        CCWidget1()
        CCWidget2()
        CCWidget3()
        CCWidget4()
        CCWidget5()
        CCWidget6()
        CCWidget7()
        CCWidget8()
        CCWidget9()
        CCWidget10()
        CCWidget11()
        CCWidget12()
        CCWidget13()
        CCWidget14()
        CCWidget15()
        CCWidget16()
        CCWidget17()
        CCWidget18()
        CCWidget19()
        CCWidget20()
        CCWidget21()
        CCWidget22()
        CCWidget23()
        CCWidget24()
        CCWidget25()
        CCWidget26()
        CCWidget27()
        CCWidget28()
        CCWidget29()
        CCWidget30()
        CCWidget31()
        CCWidget32()
        CCWidget33()
        CCWidget34()
        CCWidget35()
        CCWidget36()
        CCWidget37()
        CCWidget38()
        CCWidget39()
        CCWidget40()
        CCWidget41()
        CCWidget42()
        CCWidget43()
        CCWidget44()
        CCWidget45()
        CCWidget46()
        CCWidget47()
        CCWidget48()
        CCWidget49()
    }
}