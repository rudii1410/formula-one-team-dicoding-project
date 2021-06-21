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
            realm.add(team)
        }
    }
    
    func isTeamInFavouritesList(id teamId: String) -> Bool {
        let favourites = getFavouriteTeamById(id: teamId)
        return !favourites.isEmpty
    }
    
    func deleteFromFavouritesList(id teamId: String) {
        try! realm.write {
            let favouriteTeam = getFavouriteTeamById(id: teamId)[0]
            realm.delete(favouriteTeam)
        }
    }
    
    func getFavouriteTeamById(id teamId: String) -> [FormulaOneTeam] {
        return realm.objects(FormulaOneTeam.self).filter("idTeam = %@", teamId).map { $0 }
    }
    
    func getAllFavouritesTeam() -> [FormulaOneTeam] {
        return realm.objects(FormulaOneTeam.self).map { $0 }
    }
}
