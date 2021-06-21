//
//  FormulaTeamRepository.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 21/06/21.
//

import Foundation

class FormulaTeamRepository {
    func fetchTeamList(completion: @escaping((Result<Teams, APIError>) -> Void)) {
        NetworkManager(url: "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=4370")
            .request(completion: completion)
    }
}
