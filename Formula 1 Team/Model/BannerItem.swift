//
//  BannerItem.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 17/06/21.
//

class BannerItem: TeamDetailItem {
    var type: TeamDetailItemType {
        return .bannerWithTeamName
    }
    
    var teamBannerUrl: String
    var teamLogoUrl: String
    var teamName: String
    
    init(teamBannerUrl: String, teamLogoUrl: String, teamName: String) {
        self.teamBannerUrl = teamBannerUrl
        self.teamLogoUrl = teamLogoUrl
        self.teamName = teamName
    }
}
