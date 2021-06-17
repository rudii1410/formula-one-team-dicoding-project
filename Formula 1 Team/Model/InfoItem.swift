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
    
    var title: String
    var desc: String
    
    init(title: String, desc: String) {
        self.title = title
        self.desc = desc
    }
}
