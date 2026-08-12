enum RegistrationError: Error {
    case missingName
    case invalidEmail
    case weakPassword
}

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

func printValidationResult(name: String, email: String, password: String) {
    do {
        let message = try validateRegistration(
            name: name,
            email: email,
            password: password
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
}

print("Valid registration")
printValidationResult(
    name: "Emily",
    email: "emily@example.com",
    password: "swift123"
)

print("")
print("Missing name")
printValidationResult(
    name: "",
    email: "emily@example.com",
    password: "swift123"
)

print("")
print("Invalid email")
printValidationResult(
    name: "Kai",
    email: "kai.example.com",
    password: "swift123"
)

print("")
print("Weak password")
printValidationResult(
    name: "Alex",
    email: "alex@example.com",
    password: "123"
)
