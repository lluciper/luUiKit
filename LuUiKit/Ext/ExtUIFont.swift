//
//  ExtUIFont.swift
//  LuUiKit
//
//  Created by VN Savis on 22/02/2024.
//

import Foundation
import UIKit

extension UIFont {
    static func setDefaultFont(name: String) {
        guard let font = UIFont(name: name, size: UIFont.systemFontSize) else {
            fatalError("Font '\(name)' not found.")
        }
        
        let attributes = [NSAttributedString.Key.font: font]
        let appearance = UINavigationBar.appearance()
        appearance.titleTextAttributes = attributes
        
        UILabel.appearance().font = font
    }
}
