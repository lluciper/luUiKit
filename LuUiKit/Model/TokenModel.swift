//
//  TokenModel.swift
//  LuUiKit
//
//  Created by VN Savis on 27/02/2024.
//

import Foundation

import Foundation

// MARK: - Welcome
class TokenModel: Codable {
    let accessToken, scope, tokenType: String?
    let expiresIn: Int?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case scope
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }

    init(accessToken: String?, scope: String?, tokenType: String?, expiresIn: Int?) {
        self.accessToken = accessToken
        self.scope = scope
        self.tokenType = tokenType
        self.expiresIn = expiresIn
    }
}
