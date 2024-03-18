//
//  KeyLocalizable.swift
//  LuUiKit
//
//  Created by VN Savis on 01/03/2024.
//

import Foundation

let LocalizeDefaultLanguageKey: String = "LocalizeDefaultLanguageKey"
var languageApp: String = "en"

enum AppLocalizable: String {
    case signIn
    case signUp
    case email
    case password
    case confirmPassword
    case forgotPassword
    case or
    
    case chooseALocation
    case featured
    case categories
    case hotDrinks
    case icedDrink
    case donuts
    
    case home
    case orders
    case gift
    case account
    
    case accountSettings
    case favorites
    case notifications
    case helpCenter
    case signOut
    case language
    
    var localized: String {
        if let path = Bundle.main.path(forResource: languageApp, ofType: "lproj"), let bundle = Bundle(path: path){
            return NSLocalizedString("\(rawValue)", bundle: bundle, comment: "")
        }
        return ""
    }
    
}
