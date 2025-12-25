//
//  EclectiComment.swift
//  Ornix
//
//  Created by yangyang on 2025/12/22.
//

struct EclectiComment: Codable {
    var curatingCid: Int
    var editorialText: String
    var artisanalUid: Int
    var matchingPid: Int


   
    static let `default` = EclectiComment(
        curatingCid: -1,
        editorialText: "",
        artisanalUid: -1,
        matchingPid: -1
    )
}
