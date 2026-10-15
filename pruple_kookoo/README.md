# Purple KooKoo

Crypto price alarm dashboard built with Flutter (Android, iOS, web).

## Run

```bash
flutter pub get
flutter run -d chrome   # or an Android/iOS device or simulator
```

## Release signing (Android)

Create a keystore, then add `android/key.properties` (git-ignored):

```properties
storeFile=/absolute/path/to/upload-keystore.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

Without it, release builds fall back to the debug key.

## Notes

- Prices come from the KuCoin public API. On web the browser may block it
  (CORS); the app then gets `null` from `getRequest` and shows no price.
- App ID / bundle ID: `com.kiarash.purplekookoo`. Change it in
  `android/app/build.gradle.kts` and the Xcode project before publishing under
  your own name.
- Regenerate launcher icons after changing `assets/images/kookoo.png`:
  `dart run flutter_launcher_icons`.
