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
    var body: some View {
        VStack(spacing: 16) {
            Text("Hello App")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("My first simple Swift macOS app.")
                .font(.title3)
                .foregroundStyle(.secondary)

            Button("Say Hello") {
                print("Hello from the macOS app!")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(40)
        .frame(width: 420, height: 260)
    }
}
