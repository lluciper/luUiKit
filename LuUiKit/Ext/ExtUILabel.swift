//
//  ExtUilabel.swift
//  LuUiKit
//
//  Created by VN Savis on 22/02/2024.
//

import Foundation
import UIKit

extension UILabel {
    
    func styleBoldText(textColor: UIColor = .nameColor,
                       nameFont: String = "",
                       size: CGFloat = 16,
                       textAlignment: NSTextAlignment = .left,
                       numberOfLines: Int = 1){
        self.textColor = textColor
        self.font = UIFont(name: nameFont, size: size)
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
    
}
