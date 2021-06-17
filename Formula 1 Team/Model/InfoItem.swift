//
//  InfoItem.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 17/06/21.
//

class InfoItem: TeamDetailItem {
    var type: TeamDetailItemType {
        return .infoItem
    }
    
    var lines: Int
    var title: String
    var desc: String
    
    init(lines: Int, title: String, desc: String) {
        self.lines = lines
        self.title = title
        self.desc = desc
    }
}
