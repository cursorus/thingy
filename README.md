# CCWidgetApp — 50 настраиваемых виджетов Центра управления (iOS 18)

## Что это

Приложение-конструктор: создаёшь до **50 виджетов** для Центра управления iOS 18.
Каждый виджет настраивается независимо прямо в приложении.

## Что настраивается в каждом виджете

| Параметр | Варианты |
|----------|---------|
| Название | Любой текст (до ~12 символов) |
| Текст ВКЛ / ВЫКЛ | Любой текст |
| Иконка ВКЛ | Любой SF Symbol |
| Иконка ВЫКЛ | Любой SF Symbol |
| Цвет ВКЛ | Любой цвет (ColorPicker) |
| Цвет ВЫКЛ | Любой цвет (ColorPicker) |
| Анимация | Wiggle / Bounce / Pulse / Rotate / Без анимации |
| Действие | Toggle (вкл/выкл) / Открыть приложение по URL-схеме |

## Как собрать через GitHub Actions

1. Форкни / залей репо на GitHub
2. **Actions → Build Unsigned IPA → Run workflow**
3. Скачай `CCWidgetApp-unsigned` из артефактов
4. Установи через **AltStore**, **Sideloadly** или **TrollStore**

## Как запустить локально

```bash
brew install xcodegen
xcodegen generate --spec project.yml
open CCWidgetApp.xcodeproj
```

## Структура проекта

```
CCWidgetApp/
├── CCWidgetApp/
│   ├── CCWidgetAppApp.swift        # точка входа
│   ├── ContentView.swift           # список 50 слотов
│   ├── WidgetEditorView.swift      # редактор каждого виджета
│   ├── SharedModels.swift          # модели + UserDefaults helpers
│   ├── Info.plist
│   └── CCWidgetApp.entitlements
├── ControlCenterExtension/
│   ├── GeneratedWidgets.swift      # 50 ControlWidget structs (авто-генерация)
│   ├── SharedModels.swift          # копия shared-моделей
│   ├── Info.plist
│   └── CCExtension.entitlements
├── project.yml                     # XcodeGen конфиг
├── generate_widgets.py             # скрипт генерации виджетов
└── .github/workflows/build.yml    # GitHub Actions → unsigned IPA
```

## Изменить количество виджетов

```bash
# Открой generate_widgets.py, измени count = 50 на нужное число
python3 generate_widgets.py
# Пересобери проект
xcodegen generate --spec project.yml
```

## Требования

- iOS 18.0+
- Xcode 16+
- Swift 5.10+
