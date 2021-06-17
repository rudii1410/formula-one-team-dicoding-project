//
//  BannerItem.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 17/06/21.
//

import Foundation

class BannerItem: TeamDetailItem {
    var type: TeamDetailItemType {
        return .bannerWithTeamName
    }
    
    var teamBannerUrl: URL!
    var teamLogoUrl: URL!
    var teamName: String
    
    init(teamBannerUrl: String, teamLogoUrl: String, teamName: String) {
        self.teamBannerUrl = URL(string: teamBannerUrl)
        self.teamLogoUrl = URL(string: teamLogoUrl)
        self.teamName = teamName
    }
}
