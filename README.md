# Poweramp Clone (Flutter)

## Setup
```bash
flutter create . --org com.example --project-name poweramp_clone
# keep this repo's lib/, pubspec.yaml, analysis_options.yaml when prompted
flutter pub get
flutter run
```

## Android: android/app/src/main/AndroidManifest.xml
Add inside <manifest>:
```xml
<uses-permission android:name="android.permission.READ_MEDIA_AUDIO"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"
    android:maxSdkVersion="32"/>
```
Set `minSdkVersion 21` (or higher) in android/app/build.gradle.

## Structure
lib/core/{di,error,utils}
lib/features/library/{domain,data,presentation}
