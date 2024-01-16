//
//  ExtUIImageView.swift
//  LuUiKit
//
//  Created by VN Savis on 16/01/2024.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    
    func setImage(_ imageUrl: String){
        self.kf.setImage(with: URL(string: imageUrl))
    }
    
}
