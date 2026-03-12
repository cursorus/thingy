import os

count = 50
lines = []

lines.append("// AUTO-GENERATED — не редактируй вручную, используй generate_widgets.py")
lines.append("// Сгенерировано: 50 виджетов Control Center")
lines.append("")
lines.append("import AppIntents")
lines.append("import ControlCenter")
lines.append("import SwiftUI")
lines.append("import WidgetKit")
lines.append("")

# Shared toggle intent
lines.append("// MARK: - Toggle Intent (один на все виджеты, слот передаётся как параметр)")
lines.append("")
lines.append("struct ToggleWidgetIntent: AppIntent {")
lines.append("    static let title: LocalizedStringResource = \"Toggle CC Widget\"")
lines.append("    static let isDiscoverable = false")
lines.append("")
lines.append("    @Parameter(title: \"Slot\") var slot: Int")
lines.append("")
lines.append("    init() { self.slot = 0 }")
lines.append("    init(slot: Int) { self.slot = slot }")
lines.append("")
lines.append("    func perform() async throws -> some IntentResult {")
lines.append("        let defaults = UserDefaults.appGroup")
lines.append("        var config = defaults.loadConfig(index: slot)")
lines.append("        if config.action == .openApp, !config.actionURL.isEmpty,")
lines.append("           let url = URL(string: config.actionURL) {")
lines.append("            // openURL из extension не работает напрямую — используем openURL через environment")
lines.append("            // Сохраняем флаг, хост-приложение обработает при открытии")
lines.append("            defaults.set(config.actionURL, forKey: \"pending_open_url\")")
lines.append("        } else {")
lines.append("            config.isOn.toggle()")
lines.append("            defaults.saveConfig(config, index: slot)")
lines.append("        }")
lines.append("        ControlCenter.ControlCenterMutation.reloadControls(ofKind: widgetKind(slot))")
lines.append("        return .result()")
lines.append("    }")
lines.append("}")
lines.append("")

# Helper
lines.append("func widgetKind(_ index: Int) -> String {")
lines.append("    \"com.example.ccwidgetapp.widget\\(index)\"")
lines.append("}")
lines.append("")

# Provider
lines.append("// MARK: - Generic Provider")
lines.append("")
lines.append("struct SlotProvider: ControlValueProvider {")
lines.append("    let slot: Int")
lines.append("    var previewValue: Bool { false }")
lines.append("    func currentValue() async throws -> Bool {")
lines.append("        UserDefaults.appGroup.loadConfig(index: slot).isOn")
lines.append("    }")
lines.append("}")
lines.append("")

# View helper
lines.append("// MARK: - Shared view builder")
lines.append("")
lines.append("@ViewBuilder")
lines.append("func widgetLabel(config: WidgetConfig, isOn: Bool) -> some View {")
lines.append("    let sym = isOn ? config.symbolOn : config.symbolOff")
lines.append("    let anim = config.animation")
lines.append("    Group {")
lines.append("        switch anim {")
lines.append("        case .wiggle:")
lines.append("            Image(systemName: sym).symbolEffect(.wiggle, options: .nonRepeating, value: isOn)")
lines.append("        case .bounce:")
lines.append("            Image(systemName: sym).symbolEffect(.bounce, options: .nonRepeating, value: isOn)")
lines.append("        case .pulse:")
lines.append("            Image(systemName: sym).symbolEffect(.pulse, options: .nonRepeating, value: isOn)")
lines.append("        case .rotate:")
lines.append("            Image(systemName: sym).symbolEffect(.rotate, options: .nonRepeating, value: isOn)")
lines.append("        case .none:")
lines.append("            Image(systemName: sym)")
lines.append("        }")
lines.append("    }")
lines.append("    Text(isOn ? config.labelOn : config.labelOff)")
lines.append("}")
lines.append("")

# 50 widget structs
lines.append("// MARK: - 50 ControlWidget structs")
lines.append("")

for i in range(count):
    name = f"CCWidget{i}"
    kind = f"com.example.ccwidgetapp.widget{i}"
    lines.append(f"struct {name}: ControlWidget {{")
    lines.append(f"    static let kind = \"{kind}\"")
    lines.append(f"    private let slot = {i}")
    lines.append(f"    var body: some ControlWidgetConfiguration {{")
    lines.append(f"        StaticControlConfiguration(kind: Self.kind, provider: SlotProvider(slot: slot)) {{ isOn in")
    lines.append(f"            let cfg = UserDefaults.appGroup.loadConfig(index: slot)")
    lines.append(f"            ControlWidgetButton(action: ToggleWidgetIntent(slot: slot)) {{")
    lines.append(f"                widgetLabel(config: cfg, isOn: isOn)")
    lines.append(f"            }}")
    lines.append(f"            .tint(isOn ? cfg.colorOn.color : cfg.colorOff.color)")
    lines.append(f"        }}")
    lines.append(f"        .displayName(\"Виджет {i+1}\")")
    lines.append(f"        .description(\"Настраиваемый виджет #{i+1}\")")
    lines.append(f"    }}")
    lines.append(f"}}")
    lines.append("")

# Extension entry point
lines.append("// MARK: - Extension entry point (регистрируем все 50)")
lines.append("")
lines.append("@main")
lines.append("struct CCWidgetsBundle: ControlWidgetBundle {")
lines.append("    var body: some ControlWidget {")
for i in range(count):
    lines.append(f"        CCWidget{i}()")
lines.append("    }")
lines.append("}")

with open("/home/claude/CCWidgetApp/ControlCenterExtension/GeneratedWidgets.swift", "w") as f:
    f.write("\n".join(lines))

print(f"Generated {count} widgets, {len(lines)} lines")
