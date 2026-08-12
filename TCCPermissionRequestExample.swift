import AVFoundation
import Foundation

enum MediaPermission {
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

    var displayName: String {
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

func requestPermission(_ permission: MediaPermission, completion: @escaping () -> Void) {
    let currentStatus = AVCaptureDevice.authorizationStatus(for: permission.mediaType)

    print("\(permission.displayName) current status: \(describeStatus(currentStatus))")

    switch currentStatus {
    case .authorized:
        print("\(permission.displayName) access is already allowed.")
        completion()
    case .denied, .restricted:
        print("\(permission.displayName) access is not available. Update Privacy & Security settings if needed.")
        completion()
    case .notDetermined:
        AVCaptureDevice.requestAccess(for: permission.mediaType) { granted in
            let result = granted ? "allowed" : "denied"
            print("\(permission.displayName) request result: \(result)")
            completion()
        }
    @unknown default:
        print("\(permission.displayName) access returned an unknown status.")
        completion()
    }
}

let permissions: [MediaPermission] = [.camera, .microphone]
let group = DispatchGroup()

for permission in permissions {
    group.enter()
    requestPermission(permission) {
        group.leave()
    }
}

group.wait()
print("Finished requesting Camera and Microphone permissions.")
