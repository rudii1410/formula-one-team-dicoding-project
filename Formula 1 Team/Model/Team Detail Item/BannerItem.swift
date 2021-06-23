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
    
    init(teamBannerUrl: String?, teamLogoUrl: String?) {
        self.teamBannerUrl = URL(string: teamBannerUrl ?? "")
        self.teamLogoUrl = URL(string: teamLogoUrl ?? "")
    }
}
