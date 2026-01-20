# Blinkit Clone (Flutter)

A Flutter-based clone/prototype of the Blinkit mobile app (grocery & quick commerce). This project demonstrates a minimal but practical mobile app structure with authentication flow (phone number → OTP), theming, use of device preview for web, and a small set of commonly used UI packages.

> Status: Prototype / learning project — not production-ready. Designed for demonstration, learning, and incremental extension.

---

## Table of contents

- [Key features](#key-features)
- [Project snapshot](#project-snapshot)
- [Architecture & structure](#architecture--structure)
- [Main screens & flow](#main-screens--flow)
- [Dependencies](#dependencies)
- [Assets & fonts](#assets--fonts)
- [Getting started (setup & run)](#getting-started-setup--run)
- [Development notes & conventions](#development-notes--conventions)
- [Testing & linting](#testing--linting)
- [Common tasks](#common-tasks)
- [Roadmap & suggestions](#roadmap--suggestions)
- [Contributing](#contributing)
- [License & contact](#license--contact)

---

## Key features

- Phone number authentication UI (number input + OTP)
- Portrait-only layout (locked to portrait mode)
- DevicePreview integration for web/testing responsive layouts
- OTP input using `pinput`
- Phone input using `intl_phone_field` (and `flutter_intl_phone_field`)
- Image picking support (`image_picker`) for profile or image-related flows
- Bottom navigation capability (via `salomon_bottom_bar`)
- Custom fonts (Poppins) and launcher icon configuration

---

## Project snapshot

- Platform targets: Android, iOS, Web, macOS, Windows, Linux (boilerplate platform folders included)
- Entry point: `lib/main.dart`
  - Locks device orientation to portrait
  - Uses `DevicePreview` when running on web
  - Configures routes: `/` → Splashscreen, `/number` → Number, `/otp` → Otp
- Key directories:
  - `lib/` — application code (subfolders observed: `domain`, `repository`)
  - `assets/` — images & fonts
  - Platform folders: `android/`, `ios/`, `web/`, `macos/`, `windows/`, `linux/`

---

## Architecture & structure

The project uses a simple modular layout (ideal for small to medium prototypes):

- lib/
  - main.dart — app entry, routing, orientation & DevicePreview usage
  - domain/ — domain models / logic (existence observed; add domain-specific code here)
  - repository/ — contains UI screens and repository-scoped code (login screens found under `repository/screens/*`)
    - `repository/screens/login/number.dart` (phone number screen)
    - `repository/screens/login/otp.dart` (OTP screen)
    - `repository/screens/splash/splashscreen.dart` (splash)
- assets/
  - `images/` — app images (icon for launcher included: `assets/images/blinkit.jpg`)
  - `fonts/` — Poppins font files referenced in `pubspec.yaml`

Notes:
- The current code places screens under `repository/screens/`, which mixes UI and data/repository naming. Consider renaming `repository/screens` to `ui/screens` or `screens` for clarity, and using `repository` for data layer (API/local storage) code.

---

## Main screens & flow

- Splashscreen (`/`)
  - App start-up landing; likely handles minimal initialization and navigation to login or home.
- Number (`/number`)
  - Phone number input screen — uses `intl_phone_field` for phone formatting and country codes.
- Otp (`/otp`)
  - OTP entry screen — uses `pinput` to enter received OTP.

The login flow is a classic phone-number -> OTP flow. After OTP verification, you would typically navigate to the main/home screen with a bottom navigation bar (eligible for `salomon_bottom_bar` usage).

---

## Dependencies

Dependencies declared in `pubspec.yaml`:

- flutter (SDK)
- cupertino_icons: ^1.0.8
- device_preview: ^1.2.0
- salomon_bottom_bar: ^3.3.2
- pinput: ^5.0.2
- image_picker: ^1.2.0
- intl_phone_field: ^3.2.0
- flutter_intl_phone_field: ^0.0.7

Dev dependencies:

- flutter_test (SDK)
- flutter_lints: ^5.0.0
- flutter_launcher_icons: ^0.13.1

Notes:
- Keep an eye on package versions and upgrade where necessary. Use `flutter pub outdated` and `flutter pub upgrade --major-versions` to refresh safely.
- `image_picker` has newer versions with null-safety fixes; ensure compatibility with SDK ^3.7.2.

---

## Assets & fonts

Configured in `pubspec.yaml`:

- Assets:
  - `assets/images/` (images used in app)
- Fonts:
  - family `Bold`: `assets/fonts/Poppins-ExtraBoldItalic.ttf`
  - family `Regular`: `assets/fonts/Poppins-Regular.ttf`

Launcher icons configured by `flutter_launcher_icons` using `assets/images/blinkit.jpg`. To regenerate launcher icons run:

```bash
flutter pub get
flutter pub run flutter_launcher_icons:main
```

---

## Getting started (setup & run)

Prerequisites:

- Flutter SDK (matching or newer than the project's `environment.sdk` - currently ^3.7.2)
- Android SDK / Xcode / or web-enabled browser for running on selected platform

Steps:

1. Clone the repository
   ```bash
   git clone https://github.com/Shanmuka-p/blinkit_clone.git
   cd blinkit_clone
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. (Optional) Generate launcher icons
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

4. Run the app

   - Android:
     ```bash
     flutter run -d emulator-5554
     ```
   - iOS:
     ```bash
     flutter run -d <device_id>
     ```
   - Web (uses `DevicePreview` automatically on web):
     ```bash
     flutter run -d chrome
     ```
   - Build release (Android):
     ```bash
     flutter build apk --release
     ```
   - Build web:
     ```bash
     flutter build web
     ```

---

## Development notes & conventions

- Orientation: app is locked to portrait in `main.dart` via `SystemChrome.setPreferredOrientations`. Remove or adjust if you need landscape support.
- DevicePreview: `DevicePreview` is enabled for web by detecting `kIsWeb` — helpful for responsive testing. You can toggle this for local dev.
- Routing: simple named routing is used (`routes` in `MaterialApp`). For larger apps consider using a routing package (e.g., `go_router` or `auto_route`) for nested routes and better deep-linking.
- Folder naming: consider reorganizing `repository/screens` into `lib/ui/screens` or `lib/screens` and adopt a clear domain-data-ui separation (e.g., `data/`, `domain/`, `ui/`, `services/`).

---

## Testing & linting

- Linting: `flutter_lints` is included and `analysis_options.yaml` is present. Run:
  ```bash
  flutter analyze
  ```
- Unit & widget tests: add tests under `test/`. Currently the repository has a `test/` directory placeholder.
- Format & fix issues:
  ```bash
  dart format .
  flutter analyze
  ```

---

## Common tasks

- Add a new screen
  - Add Dart file under `lib/screens/` (or chosen UI folder)
  - Add a route in `lib/main.dart`
- Add a data/repository layer
  - Create `lib/data/` or `lib/repository/` for API, local DB, or persistence logic
- Add state management
  - Recommended starters: Provider, Riverpod, Bloc. For a small app, `Provider` or `hooks_riverpod` is lightweight and easy to adopt.

---

## Roadmap & suggestions

- Implement backend or Firebase Authentication for OTP verification
- Add home screen with product listing, categories, product details, cart, and checkout
- Integrate local persistence (e.g., Hive/SharedPreferences) for caching
- Add state management (Riverpod/Bloc) and dependency injection
- Add CI (GitHub Actions) for analysis, formatting, and unit tests
- Expand tests (unit, widget, integration)

---

## Troubleshooting

- If you get package or SDK errors:
  - Ensure Flutter SDK matches or exceeds the version required in `pubspec.yaml`
  - Run `flutter clean` and `flutter pub get`
- If `flutter_launcher_icons` doesn't change icons:
  - Confirm `image_path` exists and run `flutter pub run flutter_launcher_icons:main` again
- Image/font not found:
  - Verify the asset paths and that they are declared under `flutter.assets` and `flutter.fonts` in `pubspec.yaml`
  - Run `flutter pub get` after changes

---

## Contributing

- Fork the repo, create a feature branch, open a PR with a clear description.
- Follow the lint rules in `analysis_options.yaml`.
- Add tests for new features where possible.

---

## License & contact

- This repository contains a simple demo/learning project. Add a proper license file (e.g., MIT) if you plan to share or open-source beyond personal use.
- Author / Maintainer: Shanmuka-p
- For questions or collaboration: open an issue or contact via your GitHub profile.

---

Thank you for building and sharing this project — it’s a great starting point for a Blinkit-like quick commerce app. Use this README as a living document and update it as you add features, CI, tests, and production readiness steps.
