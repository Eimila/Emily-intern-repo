# Provisioning and Signing Summary

Provisioning and signing are part of Apple's app security and distribution
workflow. They help prove who built an app, which app identifier it belongs to,
and where the app is allowed to run.

## Code Signing

Code signing attaches a digital signature to an app. The signature proves that
the app was built by a trusted developer identity and that the app has not been
changed after it was signed.

In Xcode, signing usually uses a certificate connected to an Apple Developer
account or a local development identity.

Code signing is important because macOS, iOS, iPadOS, watchOS, and tvOS use it
to decide whether an app can run safely.

## Certificates

A certificate identifies the developer or team that signs the app.

Common certificate types include:

1. **Development certificate:** Used while building and testing an app during
   development.
2. **Distribution certificate:** Used when preparing an app for TestFlight, the
   App Store, or other release channels.

The certificate connects the built app to a trusted developer identity.

## Bundle Identifier

The bundle identifier is a unique app identifier, usually written in reverse
domain style, such as:

```text
com.example.HelloApp
```

Xcode uses the bundle identifier to connect the local project to the app record
and signing setup in the Apple Developer account.

For simple Swift Package apps, a full bundle identifier may not be configured in
the same way as a normal Xcode app project. That can lead to warnings such as a
missing main bundle identifier during local debugging, even when the app still
runs.

## Provisioning Profile

A provisioning profile connects several pieces together:

1. The app's bundle identifier.
2. The developer team.
3. The signing certificate.
4. The devices or distribution method allowed for the app.
5. The app capabilities, such as iCloud, Push Notifications, or App Groups.

For development, a provisioning profile can allow the app to run on selected
test devices. For distribution, it can allow the app to be submitted or shared
through an approved release path.

## Automatic Signing

Xcode can manage signing automatically. With automatic signing enabled, Xcode
can create or update certificates, app identifiers, and provisioning profiles
when needed.

Automatic signing is useful for small projects and learning tasks because it
reduces manual setup.

## Manual Signing

Manual signing gives the developer more control. The developer chooses the
specific certificate and provisioning profile used for each build configuration.

Manual signing is useful for larger teams, CI/CD pipelines, release builds, or
projects with strict signing requirements.

## Development vs Distribution Signing

| Area | Development Signing | Distribution Signing |
| --- | --- | --- |
| Main purpose | Run and test the app during development | Ship the app to users |
| Certificate | Development certificate | Distribution certificate |
| Profile | Development provisioning profile | Distribution provisioning profile |
| Device access | Usually limited to test devices | Based on release method |
| Used for | Debugging, local testing, device testing | TestFlight, App Store, release builds |

## Common Issues

1. **Missing bundle identifier**
   Xcode may not know which app identity to connect to signing.

2. **No matching provisioning profile**
   The selected profile may not match the bundle identifier, team, certificate,
   or device.

3. **Expired certificate**
   Signing can fail if the certificate is expired or revoked.

4. **Wrong team selected**
   Xcode may use the wrong Apple Developer team when multiple teams are
   available.

5. **Capability mismatch**
   If the app uses a capability that is not enabled in the app identifier or
   profile, signing can fail.

## Summary

Signing proves the app's identity and integrity. Provisioning controls where
the signed app is allowed to run. The bundle identifier, certificate,
provisioning profile, developer team, and app capabilities all need to match for
Xcode builds and distribution to work correctly.
