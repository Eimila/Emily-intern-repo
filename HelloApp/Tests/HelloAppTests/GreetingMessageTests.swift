import Testing
@testable import HelloApp

struct GreetingMessageTests {
    @Test func appTitleIsHelloApp() {
        let greeting = GreetingMessage()

        #expect(greeting.appTitle == "Hello App")
    }

    @Test func buttonTitleInvitesUserToSayHello() {
        let greeting = GreetingMessage()

        #expect(greeting.buttonTitle == "Say Hello")
    }

    @Test func consoleMessageMatchesButtonActionOutput() {
        let greeting = GreetingMessage()

        #expect(greeting.consoleMessage() == "Hello from the macOS app!")
    }

    @Test func featureListUsesPackageToKeepUniqueOrderedValues() {
        let greeting = GreetingMessage()

        #expect(greeting.featureList() == ["SwiftUI", "macOS", "Swift Package"])
    }
}
