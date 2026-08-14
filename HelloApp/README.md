# Hello App

<!-- cspell:words sandboxed -->

This folder contains a simple Swift macOS app built with SwiftUI.

## Project Files

- `Package.swift` defines the Swift Package project.
- `HelloApp.entitlements` lists the sandbox capabilities needed by the app.
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

## Permission Requests

The app includes a **Request Permissions** button. Click it while the app is
running to trigger two real macOS permission requests:

1. Notification permission through `UNUserNotificationCenter`.
2. Microphone permission through `AVCaptureDevice.requestAccess(for: .audio)`.

The app updates the window with whether each permission was granted or denied.
During local testing, the project built successfully from Terminal. The actual
permission prompts appear when the app is run interactively and the button is
clicked.

## Entitlements

The app includes an entitlements file:

```text
HelloApp.entitlements
```

The entitlements used are:

1. `com.apple.security.app-sandbox`
   Enables the App Sandbox. This limits the app's default system access and
   makes requested capabilities explicit.
2. `com.apple.security.device.microphone`
   Allows a sandboxed macOS app to request microphone access. The user still
   controls the final permission decision through the macOS privacy prompt.

Notification permission does not need a sandbox entitlement in this sample. It
is requested in code with `UNUserNotificationCenter`.

## Run Tests

From the repository root, run:

```bash
swift test --package-path HelloApp
```

The test suite checks the app title, button title, console message, and Swift
Package-backed feature list.
