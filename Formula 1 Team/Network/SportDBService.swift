//
//  SportDBService.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 21/06/21.
//

import Foundation

class SportDBService {
    private let baseUrl = "https://www.thesportsdb.com/api/v1/json/1"
    
    func getTeamList(completion: @escaping((Result<Teams, APIError>) -> Void)) {
        request(endpoint: "lookup_all_teams.php?id=4370", method: "GET", completion: completion)
    }
    
    private func request<T: Codable>(endpoint: String, method: String, completion: @escaping((Result<T, APIError>) -> Void)) {
        let path = "\(baseUrl)/\(endpoint)"
        guard let url = URL(string: path) else { completion(.failure(.internalError)); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { completion(.failure(.serverError)); return }
            
            do {
                guard let data = data else { completion(.failure(.serverError)); return }
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(.parsingError))
            }
        }
        task.resume()
    }
}
