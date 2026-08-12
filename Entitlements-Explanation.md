# Entitlements File Explanation

<!-- cspell:words sandboxed sandboxing -->

This deliverable includes an example macOS entitlements file:

```text
TCCExample.entitlements
```

Entitlements describe specific capabilities an app is allowed to use. They are
added to the app's code signature, so macOS can check them when the app runs.

## Included Entitlements

## App Sandbox

```xml
<key>com.apple.security.app-sandbox</key>
<true/>
```

This enables the App Sandbox. A sandboxed app starts with limited access to the
system and must explicitly request supported capabilities.

## Camera

```xml
<key>com.apple.security.device.camera</key>
<true/>
```

This allows a sandboxed macOS app to request camera access. The user still needs
to approve the Camera permission through the TCC privacy prompt.

## Microphone

```xml
<key>com.apple.security.device.microphone</key>
<true/>
```

This allows a sandboxed macOS app to request microphone access. Like Camera
access, this entitlement does not grant permission by itself. It only makes the
capability available so the app can ask the user.

## User-Selected Read-Only Files

```xml
<key>com.apple.security.files.user-selected.read-only</key>
<true/>
```

This lets the app read files that the user explicitly selects through an open
panel or document picker. It is safer than giving broad file system access
because the user chooses the files.

## Apple Events Automation

```xml
<key>com.apple.security.automation.apple-events</key>
<true/>
```

This allows the app to request permission to send Apple Events to other apps.
macOS still uses TCC to ask the user before allowing automation access.

## Relationship to TCC

Entitlements and TCC work together, but they are not the same thing.

Entitlements declare what the app is technically allowed to request. TCC records
whether the user has approved privacy-sensitive access.

For example, an app may include the Camera entitlement and still be unable to
use the camera if the user denies the Camera permission prompt.

## Xcode Usage

In an Xcode app project, an entitlements file is usually connected through the
target's Signing & Capabilities settings. Xcode then includes the entitlements
when signing the app.

For command-line signing, a file like this can be supplied to `codesign`:

```bash
codesign --entitlements TCCExample.entitlements --sign "Developer ID Application: Example" MyApp.app
```

## Summary

The example entitlements file enables sandboxing, Camera, Microphone,
user-selected read-only files, and Apple Events automation. These capabilities
support privacy-safe app behaviour because the app declares what it needs while
TCC still gives the user final control over sensitive access.
