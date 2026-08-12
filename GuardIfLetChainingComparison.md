# Guard Let and If-Let Chaining Comparison

Swift optionals represent values that may be present or may be `nil`.
`if let` chaining and `guard let` are two common ways to safely unwrap those
optional values before using them.

## If-Let Chaining

`if let` chaining unwraps several optional values in one condition. The code
inside the `if` block only runs when every optional has a value.

```swift
if let profile = profile,
   let name = profile.name,
   let email = profile.email,
   let city = profile.city {
    return "Welcome \(name)! We will contact you at \(email) in \(city)."
}

return "Profile is incomplete."
```

This style is useful when all missing values can share the same fallback result.
It keeps the successful path grouped inside one block.

## Guard Let

`guard let` unwraps optional values by checking each requirement early. If a
required value is missing, the function exits immediately.

```swift
guard let email = profile.email else {
    return "Profile is missing an email address."
}
```

This style is useful when each missing value needs its own message or handling.
It also keeps the successful path less indented after the checks pass.

## Comparison

| Feature | If-let chaining | Guard let |
| --- | --- | --- |
| Main purpose | Check several optionals together | Exit early when required data is missing |
| Failure handling | Usually one shared fallback | Specific fallback for each failed check |
| Code shape | Success code is inside the `if` block | Success code continues after the guards |
| Best for | Short checks with one incomplete state | Step-by-step validation |

## Example Files

- `GuardIfLetChaining.playground/Contents.swift` can be opened in Xcode.
- `GuardIfLetChainingExample.swift` can be run from Terminal.
