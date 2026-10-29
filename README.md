<h1 align="center">Purple KooKoo</h1>

<p align="center">
  <b>Crypto price alarms with live market data.</b><br>
  One Flutter codebase for iOS, Android and the web.
</p>

<p align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-3.47-02569B?logo=flutter&logoColor=white">
  <img alt="Dart" src="https://img.shields.io/badge/Dart-3.13-0175C2?logo=dart&logoColor=white">
  <img alt="Platforms" src="https://img.shields.io/badge/platforms-iOS%20%7C%20Android%20%7C%20Web-6f42c1">
  <img alt="Tests" src="https://img.shields.io/badge/tests-24%20passing-3ddc84">
</p>

<p align="center">
  <img src="docs/screenshots/dashboard.png" width="19%" alt="Dashboard">
  <img src="docs/screenshots/markets.png" width="19%" alt="Markets">
  <img src="docs/screenshots/alarms.png" width="19%" alt="Alarms">
  <img src="docs/screenshots/new_alarm.png" width="19%" alt="New alarm">
  <img src="docs/screenshots/settings.png" width="19%" alt="Settings">
</p>

## Features

| | |
|---|---|
| **Live market data** | Prices and 24 h change for 800+ USDT pairs from the public KuCoin API. Refreshes every 30 s, pauses in the background, supports pull-to-refresh, and degrades gracefully offline (last prices stay visible with a retry banner). |
| **Price alarms** | Notify me when a coin *rises above* or *drops below* a target. Validated against the current price, persisted on-device, swipe to delete (with undo), re-arm after firing. |
| **Local notifications** | A system notification (and an in-app banner) when an alarm fires. Permission is requested in context, not at launch, and can be switched off in Settings. |
| **Markets explorer** | Search, sort (volume, gainers, losers, A–Z), favorites filter, and one tap from any coin to a pre-filled alarm. |
| **Favorites & dashboard** | Star coins to pin them to the dashboard, with the nearest active alarm and top 24 h movers at a glance. |
| **Light, dark & system theme** | Material 3 theme built around the original purple identity; choice is remembered. |

Also: responsive layout capped for tablets and web, safe-area aware, semantic labels on icon buttons, and number formatting that adapts to price magnitude (`78,859.60`, `0.00000446`).

## Getting started

```bash
flutter pub get
flutter run                 # pick a device, or: flutter run -d chrome
```

Requires Flutter 3.47+ (Dart 3.7+). For iOS you also need Xcode and CocoaPods; for Android, the Android SDK with command-line tools.

```bash
flutter test                # 24 unit and widget tests
flutter analyze             # static analysis (clean)
flutter build apk           # Android
flutter build ios --no-codesign
flutter build web
```

## Architecture

A small, layered design with no state-management dependency. UI depends on controllers, controllers depend on data and services, and nothing flows the other way.

```mermaid
flowchart TD
    subgraph UI["screens / widgets"]
        Shell[AppShell<br/>bottom navigation]
        Shell --> Dash[Dashboard]
        Shell --> Mk[Markets]
        Shell --> Al[Alarms]
        Shell --> St[Settings]
        Form[Alarm form]
    end

    subgraph State["state - ChangeNotifier controllers"]
        MC[MarketController<br/>prices, favorites]
        AC[AlarmController<br/>alarms, evaluation]
        SC[SettingsController<br/>theme, notifications]
    end

    subgraph Data["data / services"]
        Repo[MarketRepository<br/>KuCoin API]
        Prefs[(shared_preferences)]
        Notif[AlarmNotifier<br/>local notifications]
    end

    UI -->|ListenableBuilder| State
    MC --> Repo
    MC --> Prefs
    AC --> Prefs
    SC --> Prefs
    MC -- "onData(prices)" --> AC
    AC -- "alarm fired" --> Notif
```

**Alarm flow:** every 30 s `MarketController` fetches prices, hands them to `AlarmController`, which marks crossed alarms as triggered. `AppServices` then sends a system notification and emits an in-app banner event.

```
.
├── lib/
│   ├── main.dart                 entry point, app lifecycle (pauses polling in background)
│   ├── app_services.dart         composition root and AppScope (InheritedWidget)
│   ├── core/                     theme, formatting helpers, coin icon registry
│   ├── data/                     models (Ticker, Alarm) and MarketRepository
│   ├── state/                    MarketController, AlarmController, SettingsController
│   ├── services/                 AlarmNotifier (flutter_local_notifications)
│   ├── screens/                  dashboard, markets, alarms, alarm form, settings
│   └── widgets/                  shared UI: glass card, coin icon, change chip, banners
├── test/                         unit and widget tests (fakes in helpers.dart)
├── assets/images/                coin and UI images
├── docs/screenshots/             images used in this README
├── android/  ios/  web/          platform projects
└── pubspec.yaml
```

- **Dependency injection:** `AppServices` is built once in `main()`. The HTTP client, repository, notifier and `SharedPreferences` are injectable, so tests run against fakes and `MockClient`.
- **Persistence:** alarms, favorites and settings use `shared_preferences` and tolerate corrupt data.
- **Error handling:** repository failures become a user-facing message; the last known prices stay on screen.

## Disclaimer

Prices are informational and provided by a third-party public API. This app is not financial advice.
