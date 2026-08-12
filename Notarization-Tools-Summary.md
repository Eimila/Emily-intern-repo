# Notarization Tools Summary

Notarization is Apple's security review process for macOS apps distributed
outside the Mac App Store. It helps confirm that a signed app has been checked
by Apple for known malicious content before users open it.

## Why Notarization Matters

macOS uses Gatekeeper to protect users from untrusted software. When a
downloaded app is signed and notarized, macOS can show users that the app comes
from an identified developer and passed Apple's automated notarization checks.

Notarization is especially important for apps shared through direct downloads,
disk images, ZIP files, or other non-App Store distribution methods.

## Main Tools

## codesign

`codesign` signs and verifies macOS apps, command-line tools, frameworks, and
installers.

Common uses:

1. Sign an app with a Developer ID certificate.
2. Verify that an app is signed correctly.
3. Check whether nested code, frameworks, or helper tools are signed.

Example verification command:

```bash
codesign --verify --deep --strict --verbose=2 MyApp.app
```

An app usually needs to be signed before it can be submitted for notarization.

## xcrun notarytool

`xcrun notarytool` submits signed software to Apple for notarization and checks
the notarization result.

Common uses:

1. Submit a signed archive, such as a `.zip`, `.dmg`, or `.pkg`.
2. Wait for Apple's notarization result.
3. View the status or log for a notarization submission.

Example submit command:

```bash
xcrun notarytool submit MyApp.zip --keychain-profile "notary-profile" --wait
```

The `--wait` option keeps the command running until Apple returns a result.

## xcrun stapler

`xcrun stapler` attaches the notarization ticket to the app, disk image, or
installer after notarization succeeds.

Common use:

```bash
xcrun stapler staple MyApp.app
```

Stapling is useful because it lets Gatekeeper find the notarization ticket even
when the user's Mac is offline.

## spctl

`spctl` checks how Gatekeeper evaluates an app.

Common use:

```bash
spctl --assess --type execute --verbose MyApp.app
```

This helps confirm whether macOS is likely to allow the app to run after it is
downloaded.

## Typical Notarization Workflow

1. Build the app in Release mode.
2. Sign the app with a Developer ID Application certificate.
3. Package the app as a `.zip`, `.dmg`, or `.pkg`.
4. Submit the package with `xcrun notarytool`.
5. Review the notarization result.
6. Staple the notarization ticket with `xcrun stapler`.
7. Verify the final app with `spctl` and `codesign`.

## Common Problems

1. **Unsigned nested code**
   Frameworks, helper tools, or embedded binaries may need their own signatures.

2. **Wrong certificate**
   Apps distributed outside the Mac App Store usually need a Developer ID
   certificate.

3. **Hardened Runtime missing**
   Notarized macOS apps normally need Hardened Runtime enabled.

4. **Invalid package format**
   Notarization expects supported archive or installer formats.

5. **Rejected notarization log**
   The notary log can show exactly which file or signing issue caused the
   rejection.

## Relationship to Signing

Signing proves who built the app and protects the app from being modified after
signing. Notarization adds Apple's automated security check on top of that.

A normal macOS distribution workflow usually needs both:

1. Sign the app.
2. Notarize the signed app.
3. Staple the notarization ticket.
4. Verify the final result.

## Summary

The main notarization tools are `codesign`, `xcrun notarytool`, `xcrun
stapler`, and `spctl`. Together, they help prepare a macOS app for safer
distribution outside the Mac App Store by signing it, submitting it to Apple,
attaching the notarization ticket, and checking Gatekeeper's final assessment.
