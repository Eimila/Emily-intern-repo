# AX API Snippet

<!-- cspell:words AXAPI AXUI frontmost swiftc -->

This deliverable includes a Swift Accessibility API example:

```text
AXAPIInteractionExample.swift
```

The snippet interacts with the macOS AX API by:

1. Checking whether the current process is trusted for Accessibility access.
2. Creating an `AXUIElement` for the frontmost application.
3. Listing the app element's available accessibility attributes.
4. Reading the focused app title.
5. Reading the focused window title.
6. Performing the `kAXRaiseAction` action on the focused window.

## Run or Parse

From the repository root:

```bash
swiftc -parse AXAPIInteractionExample.swift
```

To run it as a local command-line snippet, the terminal app may need to be
allowed in:

```text
System Settings > Privacy & Security > Accessibility
```

## Notes

The snippet may print a message asking for Accessibility access if the process
is not trusted yet. After enabling the permission, rerun the snippet so it can
read AX attributes from the focused app.
