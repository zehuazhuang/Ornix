struct LayeringComment: Codable, Identifiable {
    var id: Int { polishedCid }

    var polishedCid: Int
    var proportionText: String
    var bronzetoneUid: Int
    var casualwearPid: Int

    static let `default` = LayeringComment(
        polishedCid: -1,
        proportionText: "",
        bronzetoneUid: -1,
        casualwearPid: -1
    )
}
