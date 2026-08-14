import AVFoundation
import SwiftUI
import UserNotifications

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
    @State private var notificationStatus = "Notification permission: not requested"
    @State private var microphoneStatus = "Microphone permission: not requested"

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

            Button("Request Permissions") {
                // Trigger this button while the app is running to request two
                // real permissions: notifications and microphone access.
                Task {
                    await requestTwoPermissions()
                }
            }
            .buttonStyle(.bordered)

            VStack(alignment: .leading, spacing: 8) {
                Text(notificationStatus)
                Text(microphoneStatus)
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(40)
        .frame(width: 480, height: 340)
    }

    @MainActor
    private func requestTwoPermissions() async {
        notificationStatus = "Notification permission: requesting..."
        microphoneStatus = "Microphone permission: waiting..."

        do {
            let granted = try await UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge])
            notificationStatus = "Notification permission: \(granted ? "granted" : "denied")"
        } catch {
            notificationStatus = "Notification permission error: \(error.localizedDescription)"
        }

        microphoneStatus = "Microphone permission: requesting..."
        let microphoneGranted = await AVCaptureDevice.requestAccess(for: .audio)
        microphoneStatus = "Microphone permission: \(microphoneGranted ? "granted" : "denied")"
    }
}
