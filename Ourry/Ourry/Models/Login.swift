//
//  Login.swift
//  Ourry
//
//  Created by SeongHoon Jang on 12/16/23.
//

import Foundation

struct LoginResponse: Codable {
    let jwt: String?
    let code: String?
    let message: String?
}

enum AuthError: Error, Equatable {
    static func == (lhs: AuthError, rhs: AuthError) -> Bool {
        switch (lhs, rhs) {
        case (.networkError(let lhsError), .networkError(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.apiError(let lhsCode, let lhsMessage), .apiError(let rhsCode, let rhsMessage)):
            return lhsCode == rhsCode && lhsMessage == rhsMessage
        default:
            return false
        }
    }
    
    case networkError(Error)
    case apiError(code: String, message: String)
    case parsingError
}

enum LoginResult {
    case success(jwtToken: String)
    case failure(error: AuthError)
}
