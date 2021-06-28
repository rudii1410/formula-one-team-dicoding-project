//
//  NetworkManager.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 21/06/21.
//

import Foundation

class NetworkManager {
    private let path: String!
    private let method: String!
    
    init(url: String, method: String = "GET") {
        self.path = url
        self.method = method
    }
    
    func request<T: Codable>(completion: @escaping((Result<T, APIError>) -> Void)) {
        guard let url = URL(string: path) else {
            let error = APIError(type: .internalError, message: "Fail parsing URL")
            completion(.failure(error))
            return
        }
        
        let request = getRequestUrl(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                var err = APIError(type: .serverError, message: error!.localizedDescription)
                err.type = .serverError
                completion(.failure(err));
                return
            }
            
            do {
                guard let data = data else { completion(.failure(APIError(type: .serverError))); return }
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(APIError(type: .parsingError, message: "Error on parsing")))
            }
        }
        task.resume()
    }
    
    private func getRequestUrl(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        return request
    }
}
