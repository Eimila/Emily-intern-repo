# Xcode Interface Exploration

This note summarizes the main panels and areas in Xcode. Each panel supports a
different part of the app development workflow, from finding files to editing
code, checking settings, and debugging problems.

## Navigator Panel

The Navigator panel is on the left side of Xcode. It helps developers move
around the project quickly.

Common navigator tabs include:

1. **Project Navigator:** Shows project files, folders, Swift files, assets, and
   configuration files.
2. **Source Control Navigator:** Shows Git branches, changed files, commits, and
   source control history.
3. **Find Navigator:** Searches across the project for file names, symbols, or
   text inside code.
4. **Issue Navigator:** Lists build errors, warnings, and analyzer messages.
5. **Test Navigator:** Shows available tests and test results.
6. **Debug Navigator:** Shows runtime information while the app is being
   debugged.
7. **Breakpoint Navigator:** Lists breakpoints that pause the app during
   debugging.
8. **Report Navigator:** Shows build logs, test logs, and other activity
   reports.

The Navigator panel is most useful when locating files, checking errors, and
moving between parts of a project.

## Editor Panel

The Editor panel is the main workspace in the center of Xcode. This is where
developers write Swift code, edit SwiftUI views, inspect storyboards, and open
project files.

The editor changes depending on the selected file. A Swift file opens as a code
editor, an asset catalog opens as a visual asset manager, and a storyboard opens
as an interface editor.

This panel is the main area for reading, writing, and changing project content.

## Inspector Panel

The Inspector panel is on the right side of Xcode. It shows details about the
selected file, code element, or interface element.

Common inspector sections include:

1. **File Inspector:** Shows file name, path, target membership, and other file
   settings.
2. **Quick Help Inspector:** Shows documentation for selected Swift symbols.
3. **Attributes Inspector:** Shows editable properties for selected interface
   objects.
4. **Size Inspector:** Shows layout, position, and sizing details for selected
   interface elements.

The Inspector panel is useful when checking file settings, adjusting interface
properties, or reading quick documentation without leaving Xcode.

## Debug Area

The Debug area appears at the bottom of Xcode while running or debugging an app.
It includes the console and variable view.

The console shows printed output, runtime messages, and error logs. The variable
view shows values at the current breakpoint, which helps developers understand
what the app is doing step by step.

This area is most useful when testing code, reading `print()` output, and
investigating bugs.

## Toolbar

The Toolbar is at the top of Xcode. It contains controls for running and
stopping the app, choosing the scheme, selecting a simulator or device, and
checking build status.

The Toolbar gives quick access to the commands used most often during
development, especially running the app and switching test destinations.

## Library Panel

The Library panel provides reusable items that can be added to a project or
interface. In SwiftUI or storyboard work, it can show views, controls, colors,
modifiers, and snippets.

The Library is useful when building interfaces because it helps developers find
available UI components without needing to remember every name.

## Canvas

The Canvas is used mainly with SwiftUI. It previews the interface while code is
being written.

The Canvas helps developers see layout changes quickly and can reduce the need
to run the full app after every small visual update.

## Summary

Xcode separates work into panels so each part of development has a clear place.
The Navigator helps find project items, the Editor is where code and interfaces
are changed, the Inspector shows settings, the Debug area helps investigate
runtime behaviour, and the Toolbar controls running and building the app.
