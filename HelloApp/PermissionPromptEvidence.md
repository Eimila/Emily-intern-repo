# Permission Prompt Evidence

The HelloApp sample app includes real permission prompt code and matching macOS
usage description keys.

## Permission Keys

The app includes `HelloApp/Info.plist` with:

```xml
<key>NSCameraUsageDescription</key>
<string>HelloApp requests camera access to demonstrate a macOS permission prompt.</string>
<key>NSMicrophoneUsageDescription</key>
<string>HelloApp requests microphone access to demonstrate a macOS permission prompt.</string>
```

These keys match the Camera and Microphone permission requests in the sample
code.

## Trigger Code

The **Request Permissions** button in `Sources/HelloApp/HelloApp.swift`
triggers:

```swift
await AVCaptureDevice.requestAccess(for: .video)
await AVCaptureDevice.requestAccess(for: .audio)
```

The inline code comment states that Camera and Microphone are the tested macOS
permissions.

## Test Note

I verified the sample with:

```bash
swift build --package-path HelloApp
swift test --package-path HelloApp
```

The actual macOS privacy prompt appears when the app is launched interactively
and the **Request Permissions** button is clicked.
