# PetFeeder Android 2

This is the staging project for the Android rewrite. The legacy app remains in `android/` and is not modified by migration work.

The staging project targets Java 17 or 21, Android API 35, and Kotlin/Compose. Keep `android2/` independently buildable while migration plans are implemented. When feature parity is complete, remove the legacy `android/` project and rename this directory to `android/` in a dedicated migration change.
