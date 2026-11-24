# FirstAid AI – Modular Flutter Prototype

A front-end-only Flutter prototype using Provider for state management. No backend, Firebase, or external APIs are configured.

## Run locally

The ZIP contains the app source (`lib/`) and its `pubspec.yaml`, not generated Android/iOS runner folders.

1. Create a Flutter shell project:
   ```bash
   flutter create firstaid_ai
   ```
2. Copy the supplied `lib/` folder into the new project, replacing its existing `lib/` folder.
3. Replace the new project's `pubspec.yaml` with the supplied `pubspec.yaml`.
4. From the project root, run:
   ```bash
   flutter pub get
   flutter analyze
   flutter run
   ```

## Architecture

This project uses a lightweight feature-first architecture inspired by Clean Architecture:

- `core/`: shared colors, theme and reusable widgets.
- `features/<feature>/data/`: local models, data sources and repository implementations.
- `features/<feature>/presentation/`: screens, reusable feature widgets and Provider classes.

## State management

Provider / ChangeNotifier is configured in `main.dart`:
- `ChatProvider`: local chat conversation.
- `LibraryProvider`: guide search, category filter and favorites.
- `ProfileProvider`: profile and emergency contact form state.
- `TrainingProvider`: scenario selection, answer validation, score and completion.
- `DashboardProvider`: reads training progress through `ChangeNotifierProxyProvider`.

## Prototype limitations

- Chat answers are scripted locally. This is not a live AI model.
- Profile, favorites, chat and progress remain in memory and reset after app restart.
- Sample medical content must be checked and approved by a qualified first-aid professional before any real-world release.
- The app does not diagnose, triage or replace emergency services, professional care or hands-on first-aid training.

## Color palette

- Chat blue: `#A4B9CE`
- Prompt / primary wine: `#4A0404`
- Background cream: `#FFF5E1`


## Welcome screen and saved name
- The app asks for the user's name on first launch (no email/password).
- The name is stored locally with `shared_preferences` and is reused across the app.
- The name can be edited from Profile.
- Profile displays Egypt's ambulance emergency number: 123.
