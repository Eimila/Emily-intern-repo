import SwiftUI

@main
struct APIListApp: App {
    var body: some Scene {
        WindowGroup("API List App") {
            TodoListView()
        }
        .windowResizability(.contentSize)
    }
}
