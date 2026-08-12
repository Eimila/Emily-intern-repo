# TCC Reset Commands

<!-- cspell:words AddressBook AppleEvents BluetoothAlways ListenEvent ScreenCapture SystemPolicy tccutil -->

This document lists common macOS TCC reset commands for testing privacy
permission prompts.

TCC reset commands are useful when an app permission has already been allowed or
denied and the developer needs to test the first-run permission flow again.

## Basic Format

Reset one permission category for all apps:

```bash
tccutil reset Camera
```

Reset one permission category for a specific app:

```bash
tccutil reset Camera com.example.MyApp
```

The final value is the app's bundle identifier. For reliable testing, the app
should use a stable bundle identifier and a consistent code signing identity.

## Reset All TCC Permissions

Reset all privacy permission decisions for all apps:

```bash
tccutil reset All
```

Use this carefully because it clears many privacy decisions on the Mac, not just
decisions for one app.

Reset all privacy permission decisions for one app:

```bash
tccutil reset All com.example.MyApp
```

## Camera and Microphone

Reset Camera access:

```bash
tccutil reset Camera
```

Reset Camera access for one app:

```bash
tccutil reset Camera com.example.MyApp
```

Reset Microphone access:

```bash
tccutil reset Microphone
```

Reset Microphone access for one app:

```bash
tccutil reset Microphone com.example.MyApp
```

## Files and Folders

Reset Full Disk Access:

```bash
tccutil reset SystemPolicyAllFiles
```

Reset Desktop folder access:

```bash
tccutil reset SystemPolicyDesktopFolder
```

Reset Documents folder access:

```bash
tccutil reset SystemPolicyDocumentsFolder
```

Reset Downloads folder access:

```bash
tccutil reset SystemPolicyDownloadsFolder
```

App-specific examples:

```bash
tccutil reset SystemPolicyAllFiles com.example.MyApp
tccutil reset SystemPolicyDesktopFolder com.example.MyApp
tccutil reset SystemPolicyDocumentsFolder com.example.MyApp
tccutil reset SystemPolicyDownloadsFolder com.example.MyApp
```

## Screen, Accessibility, and Input

Reset Screen Recording access:

```bash
tccutil reset ScreenCapture
```

Reset Accessibility access:

```bash
tccutil reset Accessibility
```

Reset Input Monitoring access:

```bash
tccutil reset ListenEvent
```

App-specific examples:

```bash
tccutil reset ScreenCapture com.example.MyApp
tccutil reset Accessibility com.example.MyApp
tccutil reset ListenEvent com.example.MyApp
```

## Personal Data

Reset Contacts access:

```bash
tccutil reset AddressBook
```

Reset Calendar access:

```bash
tccutil reset Calendar
```

Reset Reminders access:

```bash
tccutil reset Reminders
```

Reset Photos access:

```bash
tccutil reset Photos
```

App-specific examples:

```bash
tccutil reset AddressBook com.example.MyApp
tccutil reset Calendar com.example.MyApp
tccutil reset Reminders com.example.MyApp
tccutil reset Photos com.example.MyApp
```

## Automation and Bluetooth

Reset Apple Events automation access:

```bash
tccutil reset AppleEvents
```

Reset Bluetooth access:

```bash
tccutil reset BluetoothAlways
```

App-specific examples:

```bash
tccutil reset AppleEvents com.example.MyApp
tccutil reset BluetoothAlways com.example.MyApp
```

## Testing Notes

After running a reset command, quit and reopen the app before testing the
permission prompt again. Some privacy changes do not fully apply to a running
process.

If a prompt still does not appear, check that:

1. The app is using the expected bundle identifier.
2. The app has the required usage description or entitlement.
3. The app is requesting the protected resource through the correct API.
4. The permission category uses the correct TCC service name.

## Summary

The `tccutil reset` command clears stored TCC decisions so developers can retest
privacy prompts and denied states. The safest workflow is to reset only the
specific permission and app bundle identifier being tested.
