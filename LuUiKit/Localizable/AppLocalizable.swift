//
//  KeyLocalizable.swift
//  LuUiKit
//
//  Created by VN Savis on 01/03/2024.
//

import Foundation

enum AppLocalizable: String {
    case signIn
    case signUp
    case email
    case password
    
    var localized: String {
        NSLocalizedString("\(rawValue)", comment: "")
    }
    
}
