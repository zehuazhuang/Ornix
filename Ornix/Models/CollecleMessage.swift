//
//  CollecleMessage.swift
//  Ornix
//
//  Created by yangyang on 2025/12/23.
//

struct CollecleMessage: Identifiable, Codable {
    var ornamentMid: Int
    var matchedEndText: String
    var simplifUsers: [Int]
    var comegrEndTime: String

    var id: Int { ornamentMid }
   
    static let `default` = CollecleMessage(
        ornamentMid: -1,
        matchedEndText: "",
        simplifUsers: [],
        comegrEndTime: "",
    )
}
