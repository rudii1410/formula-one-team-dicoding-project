//
//  FavouriteTeam.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 21/06/21.
//

import Foundation
import RealmSwift

class FavouriteTeam: Object {
    @objc dynamic var teamId: String = ""
    @objc dynamic var teamName: String = ""
    @objc dynamic var teamBanner: String = ""
    @objc dynamic var teamLogo: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var formedYear: String = ""
    @objc dynamic var headQuarter: String = ""
    @objc dynamic var originCountry: String = ""
    
    convenience init(team: FormulaOneTeam) {
        self.init()
        
        teamId = team.idTeam ?? ""
        teamName = team.strTeam ?? ""
        teamBanner = team.strTeamBanner ?? ""
        teamLogo = team.strTeamLogo ?? ""
        desc = team.strDescriptionEN ?? ""
        formedYear = team.intFormedYear ?? ""
        headQuarter = team.getHeadquarter()
        originCountry = team.strCountry ?? ""
    }
}
