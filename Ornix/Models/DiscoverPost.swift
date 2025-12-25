//
//  DiscoverPost.swift
//  Ornix
//
//  Created by yangyang on 2025/12/22.
//

struct DiscoverPost: Codable {
    var glamorousPid: Int
    var earthtoneText: String
    var sapphireLikes: [Int]
    var oxidizedUid: Int
    var undertoneImg: [String]


   
    static let `default` = DiscoverPost(
        glamorousPid: -1,
        earthtoneText: "",
        sapphireLikes: [],
        oxidizedUid:-1,
        undertoneImg:[],
    )
}
