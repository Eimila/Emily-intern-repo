# Permission Prompt Sample

<!-- cspell:words sandboxed tccutil -->

This sample project demonstrates two macOS permission prompts:

1. Camera access.
2. Microphone access.

The sample uses `AVCaptureDevice.authorizationStatus(for:)` to inspect the
current permission state and `AVCaptureDevice.requestAccess(for:)` to trigger
the system permission prompt when the state is `notDetermined`.

The project also includes:

1. `Info.plist` with Camera and Microphone usage descriptions.
2. `PermissionPromptSample.entitlements` with sandbox, Camera, and Microphone
   entitlements for a sandboxed macOS app target.

## Run the Sample

From this directory:

```bash
swift run
```

When the sample runs for the first time, macOS may show permission prompts for
Camera and Microphone access.

## Reset Permissions for Testing

To test the first-run prompts again, reset the permission decisions:

```bash
tccutil reset Camera
tccutil reset Microphone
```

Then quit and rerun the sample.

## Notes for App Projects

In a full macOS app bundle, connect `Info.plist` and
`PermissionPromptSample.entitlements` to the app target in Xcode. The usage
description keys explain the permission prompt text:

```xml
<key>NSCameraUsageDescription</key>
<string>This sample requests camera access to demonstrate a TCC prompt.</string>
<key>NSMicrophoneUsageDescription</key>
<string>This sample requests microphone access to demonstrate a TCC prompt.</string>
```

For sandboxed app targets, the matching Camera and Microphone entitlements
should also be enabled in Signing & Capabilities.

## Expected Output

The terminal prints each permission state before requesting access, then prints
whether Camera and Microphone access were allowed.
