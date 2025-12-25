import SwiftUI
import CryptoKit

struct AESEncryptor {

    private static let key = SymmetricKey(
        data: "your-secret-key-32bytes!".data(using: .utf8)!
    )

    static func encrypt(_ text: String) -> String {
        let data = Data(text.utf8)
        do {
            let sealedBox = try AES.GCM.seal(data, using: key)
            return sealedBox.combined?.base64EncodedString() ?? ""
        } catch {
            print("Encrypt error:", error)
            return ""
        }
    }

    static func decrypt(_ base64: String) -> String {
        guard let data = Data(base64Encoded: base64) else {
            return ""
        }
        do {
            let box = try AES.GCM.SealedBox(combined: data)
            let decrypted = try AES.GCM.open(box, using: key)
            return String(decoding: decrypted, as: UTF8.self)
        } catch {
            print("Decrypt error:", error)
            return ""
        }
    }
}
