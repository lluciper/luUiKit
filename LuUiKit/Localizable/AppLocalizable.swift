//
//  KeyLocalizable.swift
//  LuUiKit
//
//  Created by VN Savis on 01/03/2024.
//

import Foundation

let LocalizeDefaultLanguageKey: String = "LocalizeDefaultLanguageKey"

enum AppLocalizable: String {
    case signIn
    case signUp
    case email
    case password
    
    var localized: String {
        if let path = Bundle.main.path(forResource: UserDefaults.standard.string(forKey: LocalizeDefaultLanguageKey) ?? "en", ofType: "lproj"), let bundle = Bundle(path: path){
            return NSLocalizedString("\(rawValue)", bundle: bundle, comment: "")
        }
        return ""
    }
    
}
