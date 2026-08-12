import Collections

struct GreetingMessage {
    let appTitle = "Hello App"
    let appDescription = "My first simple Swift macOS app."
    let buttonTitle = "Say Hello"

    func featureList() -> [String] {
        let features: OrderedSet = [
            "SwiftUI",
            "macOS",
            "Swift Package",
            "SwiftUI",
        ]

        return Array(features)
    }

    func consoleMessage() -> String {
        return "Hello from the macOS app!"
    }
}
