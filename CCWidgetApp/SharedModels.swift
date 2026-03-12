// SharedModels.swift
// Используется и в хост-приложении, и в extension (через shared target или copy)

import Foundation
import SwiftUI

// MARK: - Константы

let kAppGroupID = "group.com.example.ccwidgetapp"
let kWidgetCount = 50

func widgetKey(_ index: Int) -> String { "widget_config_\(index)" }

// MARK: - Модель конфига одного виджета

struct WidgetConfig: Codable, Equatable {
    var label: String           // Название в CC (до ~12 символов)
    var labelOn: String         // Текст когда включён
    var labelOff: String        // Текст когда выключен
    var symbolOn: String        // SF Symbol имя — включён
    var symbolOff: String       // SF Symbol имя — выключен
    var colorOn: CodableColor   // Цвет когда включён
    var colorOff: CodableColor  // Цвет когда выключен
    var animation: WidgetAnimation
    var action: WidgetAction
    var actionURL: String       // URL-схема для .openURL и .openApp
    var isOn: Bool              // Текущее состояние toggle

    static func defaultConfig(index: Int) -> WidgetConfig {
        WidgetConfig(
            label: "Виджет \(index + 1)",
            labelOn: "Вкл",
            labelOff: "Выкл",
            symbolOn: "star.fill",
            symbolOff: "star",
            colorOn: CodableColor(.teal),
            colorOff: CodableColor(.gray),
            animation: .wiggle,
            action: .toggle,
            actionURL: "",
            isOn: false
        )
    }
}

// MARK: - Анимации

enum WidgetAnimation: String, Codable, CaseIterable, Identifiable {
    case wiggle, bounce, pulse, rotate, none
    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .wiggle:  return "Wiggle"
        case .bounce:  return "Bounce"
        case .pulse:   return "Pulse"
        case .rotate:  return "Rotate"
        case .none:    return "Без анимации"
        }
    }
}

// MARK: - Действие

enum WidgetAction: String, Codable, CaseIterable, Identifiable {
    case toggle      // Переключить on/off
    case openApp     // Открыть приложение по URL-схеме
    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .toggle:   return "Toggle (вкл/выкл)"
        case .openApp:  return "Открыть приложение"
        }
    }
}

// MARK: - Codable Color (SwiftUI.Color не Codable)

struct CodableColor: Codable, Equatable {
    var r: Double
    var g: Double
    var b: Double
    var a: Double

    init(_ color: Color) {
        let ui = UIColor(color)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        ui.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        r = Double(red); g = Double(green); b = Double(blue); a = Double(alpha)
    }

    var color: Color { Color(.sRGB, red: r, green: g, blue: b, opacity: a) }
}

// MARK: - UserDefaults helpers

extension UserDefaults {
    static var appGroup: UserDefaults {
        UserDefaults(suiteName: kAppGroupID)!
    }

    func saveConfig(_ config: WidgetConfig, index: Int) {
        if let data = try? JSONEncoder().encode(config) {
            set(data, forKey: widgetKey(index))
        }
    }

    func loadConfig(index: Int) -> WidgetConfig {
        guard let data = data(forKey: widgetKey(index)),
              let config = try? JSONDecoder().decode(WidgetConfig.self, from: data)
        else { return .defaultConfig(index: index) }
        return config
    }
}
