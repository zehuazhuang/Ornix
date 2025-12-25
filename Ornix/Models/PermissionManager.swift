import AVFoundation
import Photos

final class PermissionManager {

  
    static func checkMicrophonePermission(
        completion: @escaping (Bool) -> Void
    ) {
        switch AVAudioSession.sharedInstance().recordPermission {
        case .granted:
            completion(true)

        case .undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }

        case .denied:
            completion(false)

        @unknown default:
            completion(false)
        }
    }

   
    static func checkCameraPermission(
        completion: @escaping (Bool) -> Void
    ) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            completion(true)

        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }

        case .denied, .restricted:
            completion(false)

        @unknown default:
            completion(false)
        }
    }

    
    static func checkPhotoPermission(
        completion: @escaping (Bool) -> Void
    ) {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)

        switch status {
        case .authorized, .limited:
            completion(true)

        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { newStatus in
                DispatchQueue.main.async {
                    completion(newStatus == .authorized || newStatus == .limited)
                }
            }

        case .denied, .restricted:
            completion(false)

        @unknown default:
            completion(false)
        }
    }
}
