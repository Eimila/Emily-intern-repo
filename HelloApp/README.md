# Hello App

This folder contains a simple Swift macOS app built with SwiftUI.

## Project Files

- `Package.swift` defines the Swift Package project.
- `Sources/HelloApp/HelloApp.swift` contains the SwiftUI macOS app entry point
  and main view.
- `Sources/HelloApp/GreetingMessage.swift` contains small reusable app text
  logic.
- `Tests/HelloAppTests/GreetingMessageTests.swift` contains Swift tests for the
  app text logic.

## Run in Xcode

1. Open Xcode.
2. Choose **File > Open**.
3. Select the `HelloApp` folder.
4. Choose the `HelloApp` scheme.
5. Press `Command + R` to build and run.

## Build From Terminal

From the repository root, run:

```bash
swift build --package-path HelloApp
```

The app shows a small window with a hello message and a short description.

## Run Tests

From the repository root, run:

```bash
swift test --package-path HelloApp
```

The test suite checks the app title, button title, console message, and Swift
Package-backed feature list.
