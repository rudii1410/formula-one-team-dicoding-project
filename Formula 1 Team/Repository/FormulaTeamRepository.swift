//
//  FormulaTeamRepository.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 21/06/21.
//

import Foundation
import RealmSwift

class FormulaTeamRepository {
    private lazy var realm: Realm = {
        return try! Realm()
    }()
    
    func fetchTeamList(completion: @escaping((Result<Teams, APIError>) -> Void)) {
        NetworkManager(url: "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=4370")
            .request(completion: completion)
    }
    
    func storeAsFavourite(team: FormulaOneTeam) {
        try! realm.write {
            let team = FavouriteTeam(team: team)
            realm.add(team)
        }
    }
    
    func isTeamInFavouritesList(id teamId: String) -> Bool {
        let favourites = getFavouriteTeamById(id: teamId)
        return !favourites.isEmpty
    }
    
    func deleteFromFavouritesList(id teamId: String) {
        try! realm.write {
            realm.delete(getFavouriteTeamById(id: teamId))
        }
    }
    
    func getFavouriteTeamById(id teamId: String) -> Results<FavouriteTeam> {
        return realm.objects(FavouriteTeam.self).filter("teamId = %@", teamId)
    }
}
