//
//  FormulaTeamResponse.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 18/06/21.
//

import Foundation

struct FormulaOneTeam : Codable {
    let idTeam : String?
    let strTeam : String?
    let intFormedYear : String?
    let strSport : String?
    let strLeague : String?
    let idLeague : String?
    let strStadium : String?
    let strStadiumLocation : String?
    let strWebsite : String?
    let strFacebook : String?
    let strTwitter : String?
    let strInstagram : String?
    let strDescriptionEN : String?
    let strCountry : String?
    let strTeamLogo : String?
    let strTeamFanart1 : String?
    let strTeamFanart2 : String?
    let strTeamFanart3 : String?
    let strTeamFanart4 : String?
    let strTeamBanner : String?
    let strYoutube : String?
}

struct Teams: Codable {
    let teams: [FormulaOneTeam]?
}
