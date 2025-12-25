import Foundation
import AVFoundation
import Combine

final class AudioRecorderManager: ObservableObject {

    private var recorder: AVAudioRecorder?
    private(set) var currentFileURL: URL?

    func startRecording() {
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(.playAndRecord, mode: .default)
        try? session.setActive(true)

        let fileName = UUID().uuidString + ".m4a"
        let url = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)

        currentFileURL = url

        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        recorder = try? AVAudioRecorder(url: url, settings: settings)
        recorder?.record()
    }

    func stopRecording() -> URL? {
        recorder?.stop()
        recorder = nil
        return currentFileURL
    }

    var isRecording: Bool {
        recorder?.isRecording == true
    }
}

