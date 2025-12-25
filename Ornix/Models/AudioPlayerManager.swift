import AVFoundation

final class AudioPlayerManager: NSObject {

    static let shared = AudioPlayerManager()

    private var player: AVAudioPlayer?

    func play(url: URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("error:", error.localizedDescription)
        }
    }

    func stop() {
        player?.stop()
        player = nil
    }
}
