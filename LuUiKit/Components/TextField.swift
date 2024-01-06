//
//  TextField.swift
//  LuUiKit
//
//  Created by VN Savis on 03/01/2024.
//

import Foundation 
import UIKit

class TextField: UITextField {

    var textPadding = UIEdgeInsets(
           top: 0,
           left: 0,
           bottom: 0,
           right: 0
       )

       override func textRect(forBounds bounds: CGRect) -> CGRect {
           let rect = super.textRect(forBounds: bounds)
           return rect.inset(by: textPadding)
       }

       override func editingRect(forBounds bounds: CGRect) -> CGRect {
           let rect = super.editingRect(forBounds: bounds)
           return rect.inset(by: textPadding)
       }
}
