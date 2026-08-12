# Generic Type and Function Example

Swift generics let code work with different types while still keeping type
safety. Instead of writing the same logic for `String`, `Int`, or other types,
generic code uses a placeholder type.

## Generic Type

```swift
struct ResultBox<Value> {
    let value: Value
    let message: String
}
```

`Value` is a generic placeholder. A `ResultBox<String>` can store a `String`,
and a `ResultBox<Int>` can store an `Int`, while both use the same struct.

```swift
let nameResult = ResultBox(value: "Emily", message: "Student name loaded")
let scoreResult = ResultBox(value: 92, message: "Assessment score loaded")
```

## Generic Function

```swift
func firstItem<Item>(from items: [Item]) -> Item? {
    return items.first
}
```

`Item` is a generic placeholder for the array element type. The same function
can return the first `String`, first `Int`, or first value of another type.

## Generic Function With Constraint

```swift
func highestScore<Score: Comparable>(from scores: [Score]) -> Score? {
    return scores.max()
}
```

The `Comparable` constraint means the values must support comparison, so Swift
knows that `max()` is valid.

## Why It Is Useful

Generics reduce repeated code and make reusable types and functions while
preserving Swift's compile-time type checks.

## Example File

Run the standalone Swift example from Terminal:

```bash
swift GenericTypeFunctionExample.swift
```
