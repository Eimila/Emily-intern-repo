protocol WelcomeMessagePrintable {
    func printWelcomeMessage()
}

extension WelcomeMessagePrintable {
    func printWelcomeMessage() {
        print("Welcome to the Swift practice app.")
    }
}

struct DefaultWelcomeMessage: WelcomeMessagePrintable {
}

struct CustomWelcomeMessage: WelcomeMessagePrintable {
    func printWelcomeMessage() {
        print("Welcome back, Emily.")
    }
}

let defaultMessage = DefaultWelcomeMessage()
let customMessage = CustomWelcomeMessage()

print("Protocol default implementation")
defaultMessage.printWelcomeMessage()

print("")
print("Custom implementation")
customMessage.printWelcomeMessage()
