import SwiftUI

@main
struct HelloApp: App {
    var body: some Scene {
        WindowGroup("Hello App") {
            ContentView()
        }
        .windowResizability(.contentSize)
    }
}

struct ContentView: View {
    private let greeting = GreetingMessage()

    var body: some View {
        VStack(spacing: 16) {
            Text(greeting.appTitle)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(greeting.appDescription)
                .font(.title3)
                .foregroundStyle(.secondary)

            Button(greeting.buttonTitle) {
                print(greeting.consoleMessage())
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(40)
        .frame(width: 420, height: 260)
    }
}
