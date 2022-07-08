//
//  MatchCellViewModel.swift
//  TinderTutorial
//
//  Created by 민호 on 2022/05/21.
//

import Foundation

struct MatchCellViewModel {
    
    let nameText: String
    var profileImageUrl: URL?
    let uid: String
    
    init(match: Match) {
        nameText = match.name
        profileImageUrl = URL(string: match.profileImageUrl)
        uid = match.uid
    }
}
