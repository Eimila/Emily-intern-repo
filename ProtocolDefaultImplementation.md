# Protocol With Default Implementation

In Swift, a protocol defines requirements that a type agrees to provide. A
protocol extension can provide default implementations for those requirements,
so conforming types do not always need to write the same method themselves.

## Example

```swift
protocol ReportPrintable {
    var title: String { get }
    var author: String { get }

    func printSummary()
}

extension ReportPrintable {
    func printSummary() {
        print("\(title) by \(author)")
    }
}
```

`ReportPrintable` requires a `title`, an `author`, and a `printSummary()`
method. The extension gives `printSummary()` a default implementation.

Any type that conforms to `ReportPrintable` can use the default method:

```swift
struct LearningNote: ReportPrintable {
    let title: String
    let author: String
}
```

A type can also replace the default implementation when it needs custom
behaviour:

```swift
struct ProjectReport: ReportPrintable {
    let title: String
    let author: String
    let status: String

    func printSummary() {
        print("\(title) by \(author) is currently \(status).")
    }
}
```

## Why It Is Useful

Default implementations reduce repeated code while still allowing specific
types to customize behaviour when needed.

## Example File

Run the standalone Swift example from Terminal:

```bash
swift ProtocolDefaultImplementationExample.swift
```

There is also a shorter file named `SimpleProtocolDefaultImplementation.swift`
that shows the minimum pattern requested by the deliverable:

1. A protocol with one method.
2. A default implementation in an extension.
3. One type that uses the default implementation.
4. One type that provides a custom implementation.
