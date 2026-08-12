# TCC System Overview

<!-- cspell:words sandboxing tccutil -->

TCC stands for Transparency, Consent, and Control. It is Apple's privacy
permission system for macOS and iOS. TCC controls whether apps can access
protected user data and sensitive system features.

The main goal of TCC is to make privacy access visible to the user. Apps should
not be able to read private information, record input, use the camera, or
observe the screen unless the user has granted permission.

## What TCC Protects

TCC protects access to privacy-sensitive data and device features.

Common protected areas include:

1. Contacts, Calendars, Reminders, and Photos.
2. Camera and Microphone.
3. Location Services.
4. Bluetooth.
5. Accessibility control.
6. Screen Recording.
7. Full Disk Access.
8. Files and folders such as Desktop, Documents, and Downloads.
9. Automation access between apps.

The exact permission list depends on the operating system version and app
platform.

## How TCC Works

When an app tries to use a protected resource, macOS checks whether that app
already has permission. If there is no existing decision, the system may show a
permission prompt to the user.

The user's choice is stored by the operating system. After that, macOS applies
the stored decision automatically until the user changes it in System Settings
or the permission record is reset.

TCC decisions are tied to the app's identity. For a normal app, that identity is
based on details such as the bundle identifier and code signing information.
This is why signing and stable bundle identifiers matter when testing privacy
permissions.

## User Control

Users can review and change many TCC permissions in:

```text
System Settings > Privacy & Security
```

From there, users can enable or disable access for individual apps. For some
permissions, the app must be quit and reopened before the change fully applies.

This user control is important because privacy permission should not be a hidden
developer decision. The user remains the final authority for sensitive access.

## Developer Responsibilities

Developers need to request privacy access clearly and only when it is needed.

Important responsibilities include:

1. Add the correct privacy usage description keys to the app's configuration.
2. Explain why the app needs the data or feature.
3. Request permission at a meaningful time, not immediately on launch unless
   the feature is essential.
4. Handle denied permissions gracefully.
5. Avoid collecting more data than the feature requires.
6. Test permission flows with a properly signed app and stable bundle
   identifier.

For example, an app that records audio should include a clear microphone usage
description and should still behave safely if the user denies microphone
access.

## Common TCC Issues

1. **Missing usage description**
   The app may crash or fail to request permission if the required privacy
   description is missing.

2. **Permission denied**
   The user may have denied access earlier, so the app needs to guide them to
   System Settings instead of repeatedly requesting access.

3. **Changing bundle identifiers**
   A different bundle identifier can make macOS treat the app as a different
   app for permission purposes.

4. **Unsigned or ad hoc builds**
   Local test builds may behave differently from properly signed builds because
   TCC relies on app identity.

5. **Permission reset needed during testing**
   Developers may need to reset privacy decisions while testing permission
   prompts and denied states.

## Testing and Troubleshooting

During development, it is useful to test both allowed and denied permission
states. A good test plan should confirm that:

1. The app shows the correct system prompt when access is first requested.
2. The usage description explains the reason clearly.
3. The app works correctly when access is allowed.
4. The app shows a helpful fallback when access is denied.
5. Privacy settings can be changed later without breaking the app.

On macOS, developers can also use the `tccutil` command to reset selected
privacy permissions for testing.

Example:

```bash
tccutil reset Camera
```

This resets the Camera permission decisions so the app can be tested again from
a first-run state.

## Relationship to App Security

TCC is one part of Apple's broader app security model. Code signing identifies
the app, sandboxing limits what the app can access by default, entitlements
declare specific capabilities, and TCC asks the user for consent before
granting privacy-sensitive access.

These systems work together:

1. Code signing helps macOS recognize the app.
2. Entitlements declare the app capabilities.
3. Sandboxing limits the app's default access.
4. TCC records the user's privacy decisions.

## Summary

TCC gives users transparency, consent, and control over sensitive app access. It
protects data such as Contacts, Photos, Location, Camera, Microphone, screen
content, and selected files. Developers should request access only when needed,
explain the reason clearly, handle denial gracefully, and test permission flows
with a stable app identity.
