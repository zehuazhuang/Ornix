//
//  PolishedUser.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

struct PolishedUser: Codable {
    var refinedUid: Int
    var elegantName: String
    var accentingCoin: Int
    var pairingAvatar: String
    var anchoringEmail: String
    var crystalsPassword: String
    var platinumBlock: [Int]
    var centeringFollow: [Int]
    var stylingFans: [Int]

   
    static let `default` = PolishedUser(
        refinedUid: -1,
        elegantName: "",
        accentingCoin: 0,
        pairingAvatar:"",
        anchoringEmail:"",
        crystalsPassword:"",
        platinumBlock:[],
        centeringFollow:[],
        stylingFans:[]
    )
}
