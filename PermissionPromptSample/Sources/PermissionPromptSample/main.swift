import AVFoundation
import Foundation

enum PermissionRequest {
    case camera
    case microphone

    var mediaType: AVMediaType {
        switch self {
        case .camera:
            return .video
        case .microphone:
            return .audio
        }
    }

    var label: String {
        switch self {
        case .camera:
            return "Camera"
        case .microphone:
            return "Microphone"
        }
    }
}

func describeStatus(_ status: AVAuthorizationStatus) -> String {
    switch status {
    case .authorized:
        return "authorized"
    case .denied:
        return "denied"
    case .restricted:
        return "restricted"
    case .notDetermined:
        return "not determined"
    @unknown default:
        return "unknown"
    }
}

func requestPermission(_ permission: PermissionRequest) async -> Bool {
    let status = AVCaptureDevice.authorizationStatus(for: permission.mediaType)

    print("\(permission.label) status before request: \(describeStatus(status))")

    switch status {
    case .authorized:
        return true
    case .denied, .restricted:
        return false
    case .notDetermined:
        return await AVCaptureDevice.requestAccess(for: permission.mediaType)
    @unknown default:
        return false
    }
}

@main
struct PermissionPromptSample {
    static func main() async {
        print("Permission prompt sample started.")
        print("The system may show Camera and Microphone permission prompts.")
        print("")

        let cameraAllowed = await requestPermission(.camera)
        print("Camera allowed: \(cameraAllowed)")
        print("")

        let microphoneAllowed = await requestPermission(.microphone)
        print("Microphone allowed: \(microphoneAllowed)")
        print("")

        print("Permission prompt sample finished.")
    }
}
