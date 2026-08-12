import AppKit
import ApplicationServices
import Foundation

func requestAccessibilityTrustIfNeeded() -> Bool {
    let options = [
        kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true,
    ] as CFDictionary

    return AXIsProcessTrustedWithOptions(options)
}

func focusedApplicationElement() -> AXUIElement? {
    guard let runningApp = NSWorkspace.shared.frontmostApplication else {
        return nil
    }

    return AXUIElementCreateApplication(runningApp.processIdentifier)
}

func copiedAttribute<T>(
    _ attribute: String,
    from element: AXUIElement,
    as type: T.Type
) -> T? {
    var value: CFTypeRef?
    let result = AXUIElementCopyAttributeValue(
        element,
        attribute as CFString,
        &value
    )

    guard result == .success else {
        print("Could not read \(attribute). AX error: \(result.rawValue)")
        return nil
    }

    return value as? T
}

func printFocusedApplicationDetails() {
    guard requestAccessibilityTrustIfNeeded() else {
        print("Accessibility access is not trusted yet.")
        print("Enable it in System Settings > Privacy & Security > Accessibility.")
        return
    }

    guard let appElement = focusedApplicationElement() else {
        print("No focused application found.")
        return
    }

    let appTitle = copiedAttribute(
        kAXTitleAttribute,
        from: appElement,
        as: String.self
    ) ?? "Untitled app"

    print("Focused app title: \(appTitle)")

    guard let focusedWindow = copiedAttribute(
        kAXFocusedWindowAttribute,
        from: appElement,
        as: AXUIElement.self
    ) else {
        print("Focused app does not expose a focused window.")
        return
    }

    let windowTitle = copiedAttribute(
        kAXTitleAttribute,
        from: focusedWindow,
        as: String.self
    ) ?? "Untitled window"

    print("Focused window title: \(windowTitle)")

    let raiseResult = AXUIElementPerformAction(
        focusedWindow,
        kAXRaiseAction as CFString
    )

    if raiseResult == .success {
        print("Raised the focused window with AX API.")
    } else {
        print("Could not raise focused window. AX error: \(raiseResult.rawValue)")
    }
}

printFocusedApplicationDetails()
