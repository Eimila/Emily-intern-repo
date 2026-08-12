# Custom Error and Try Catch Example

Swift uses throwing functions to report errors that a caller should handle.
A custom error type makes those failure cases clear and specific.

## Custom Error

```swift
enum RegistrationError: Error {
    case missingName
    case invalidEmail
    case weakPassword
}
```

This enum lists the validation errors that can happen during registration.

## Throwing Function

```swift
func validateRegistration(name: String, email: String, password: String) throws -> String {
    if name.isEmpty {
        throw RegistrationError.missingName
    }

    if !email.contains("@") {
        throw RegistrationError.invalidEmail
    }

    if password.count < 8 {
        throw RegistrationError.weakPassword
    }

    return "Registration is valid for \(name)."
}
```

The `throws` keyword means this function may throw an error instead of returning
a normal value.

## Try Catch

```swift
do {
    let message = try validateRegistration(
        name: "Emily",
        email: "emily@example.com",
        password: "swift123"
    )
    print(message)
} catch RegistrationError.missingName {
    print("Please enter your name.")
} catch RegistrationError.invalidEmail {
    print("Please enter a valid email address.")
} catch RegistrationError.weakPassword {
    print("Password must be at least 8 characters.")
} catch {
    print("Something went wrong: \(error)")
}
```

`try` marks the line that may throw. The `catch` blocks handle each possible
error.

## Example File

Run the standalone Swift example from Terminal:

```bash
swift CustomErrorTryCatchExample.swift
```
