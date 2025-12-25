//
//  LuxuriousPost.swift
//  Ornix
//
//  Created by yangyang on 2025/12/19.
//

struct LuxuriousPost: Codable {
    var matchingPid: Int
    var structuredText: String
    var pendantLikes: [Int]
    var obsidianUid: Int
    var ceramicImg: String
    var titaniumUrl: String


   
    static let `default` = LuxuriousPost(
        matchingPid: -1,
        structuredText: "",
        pendantLikes: [],
        obsidianUid:-1,
        ceramicImg:"",
        titaniumUrl:"",

    )
}
