//
//  FormulaTeamResponse.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 18/06/21.
//

import Foundation
import RealmSwift

class FormulaOneTeam : Object, Codable {
    @objc dynamic var idTeam : String?
    @objc dynamic var strTeam : String?
    @objc dynamic var intFormedYear : String?
    @objc dynamic var strSport : String?
    @objc dynamic var strLeague : String?
    @objc dynamic var idLeague : String?
    @objc dynamic var strStadium : String?
    @objc dynamic var strStadiumLocation : String?
    @objc dynamic var strWebsite : String?
    @objc dynamic var strFacebook : String?
    @objc dynamic var strTwitter : String?
    @objc dynamic var strInstagram : String?
    @objc dynamic var strDescriptionEN : String?
    @objc dynamic var strCountry : String?
    @objc dynamic var strTeamLogo : String?
    @objc dynamic var strTeamFanart1 : String?
    @objc dynamic var strTeamFanart2 : String?
    @objc dynamic var strTeamFanart3 : String?
    @objc dynamic var strTeamFanart4 : String?
    @objc dynamic var strTeamBanner : String?
    @objc dynamic var strYoutube : String?
    
    func getHeadquarter() -> String {
        var headQuarter = "Unknown"
        if let stadium = strStadium, !stadium.isEmpty { headQuarter = stadium }
        else if let stadiumLocation = strStadiumLocation, !stadiumLocation.isEmpty { headQuarter = stadiumLocation }
        
        return headQuarter
    }
    
    func getFanart() -> [String] {
        var result: [String] = []
        
        if let image1 = strTeamFanart1 { result.append(image1) }
        if let image2 = strTeamFanart2 { result.append(image2) }
        if let image3 = strTeamFanart3 { result.append(image3) }
        if let image4 = strTeamFanart4 { result.append(image4) }
        if let image5 = strTeamBanner { result.append(image5) }
        
        return result
    }
}

struct Teams: Codable {
    let teams: [FormulaOneTeam]?
}
