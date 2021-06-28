//
//  APIError.swift
//  Formula 1 Team
//
//  Created by Rudiyanto on 21/06/21.
//

enum ErrorType {
    case internalError
    case serverError
    case parsingError
}

struct APIError: Error {
    var type: ErrorType = .serverError
    var message: String = ""
}
