# Chapter 1 — StatefulWidget Lifecycle

A small Flutter application demonstrating the lifecycle of a `StatefulWidget`.

## Assignment requirements covered

- A small `StatefulWidget` is implemented in `lib/main.dart`.
- `print()` statements are included in `initState()`, `build()`, and `dispose()`.
- The counter button calls `setState()` and changes the UI.
- The demo widget can be removed and shown again, making `dispose()` and a new `initState()` observable.
- A second page can be opened and popped to demonstrate route lifecycle events.
- A short lifecycle conclusion is included in `docs/lifecycle-observation.md`.

## Run the application

1. Install Flutter and confirm your setup:

   ```bash
   flutter doctor
   ```

2. Open this project folder in a terminal.
3. If this archive was extracted as a minimal Flutter source project and platform folders are missing, generate them once:

   ```bash
   flutter create --platforms=android,web,linux --project-name chapter1 .
   ```

   Keep the existing `lib/main.dart` if Flutter asks about overwriting it.

4. Get dependencies:

   ```bash
   flutter pub get
   ```

5. Run on Chrome (Chrome must be installed):

   ```bash
   flutter run -d chrome
   ```

   Or run on a connected Android device / emulator:

   ```bash
   flutter devices
   flutter run
   ```

## How to observe the lifecycle

1. Start the app and watch the terminal / Debug Console.
2. The first display of the counter widget prints `initState()` and `build()`.
3. Press **Increase counter (setState)** several times. The counter changes and `build()` prints again after each state update. `initState()` does not run again for the same State object.
4. Press **Remove demo widget**. The widget is removed from the widget tree and `dispose()` prints.
5. Press **Show demo widget again**. A new State object is created, so `initState()` and `build()` print again.
6. Press **Navigate to another page**. The details page prints its `initState()` and `build()` messages. Press **Go back**; its `dispose()` message prints.

## Run the widget tests

```bash
flutter test
```

The tests check counter updates, removal/restoration of the demo widget, and navigation.

## Ubuntu convenience scripts

- `./run_on_ubuntu.sh` generates missing platform folders if needed, fetches packages, and starts the app in Chrome.
- `./publish_to_github.sh` checks your GitHub CLI login, creates the public `Salim-Hakimi/chapter1` repository if it does not exist, and pushes the project. It uses your local `gh` authentication; it does not store a GitHub token in this project.
