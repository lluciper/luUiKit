//
//  OdersViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 15/01/2024.
//

import UIKit
import SwiftSVG

class OdersViewController: UIViewController {
    
    @IBOutlet weak var marginLeftCart: NSLayoutConstraint!
    @IBOutlet weak var marginRightbag: NSLayoutConstraint!
    @IBOutlet weak var imgBag: UIImageView!
    @IBOutlet weak var imgCook: UIImageView!
    @IBOutlet weak var imgCart: UIImageView!
    @IBOutlet weak var lineCookBag: UIView!
    @IBOutlet weak var lineCartCook: UIView!
    @IBOutlet weak var dotbag: UIView!
    @IBOutlet weak var dotCook: UIView!
    @IBOutlet weak var dotCart: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onChangeStatusOder(.cart)
        
    }
    
    func onChangeStatusOder(_ status: StatusOder) {
        switch status {
        case .cart:
            dotCook.backgroundColor = UIColor(hexString: "D9D9D9")
            dotbag.backgroundColor = UIColor(hexString: "D9D9D9")
            lineCartCook.backgroundColor = UIColor(hexString: "D9D9D9")
            lineCookBag.backgroundColor = UIColor(hexString: "D9D9D9")
            imgCook.tintColor = UIColor(hexString: "D9D9D9")
            imgBag.tintColor = UIColor(hexString: "D9D9D9")
            imgCart.widthAnchor.constraint(equalToConstant: 40).isActive = true
            imgCart.heightAnchor.constraint(equalToConstant: 40).isActive = true
            imgCook.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgCook.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imgBag.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgBag.heightAnchor.constraint(equalToConstant: 24).isActive = true
            marginLeftCart.constant = -4
            marginRightbag.constant = 8
        case .cooks:
            dotCook.backgroundColor = UIColor(hexString: "FF9666")
            dotbag.backgroundColor = UIColor(hexString: "D9D9D9")
            lineCartCook.backgroundColor = UIColor(hexString: "FF9666")
            lineCookBag.backgroundColor = UIColor(hexString: "D9D9D9")
            imgCook.tintColor = UIColor(hexString: "FF9666")
            imgBag.tintColor = UIColor(hexString: "D9D9D9")
            imgCart.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgCart.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imgCook.widthAnchor.constraint(equalToConstant: 40).isActive = true
            imgCook.heightAnchor.constraint(equalToConstant: 40).isActive = true
            imgBag.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgBag.heightAnchor.constraint(equalToConstant: 24).isActive = true
            marginLeftCart.constant = 4
            marginRightbag.constant = 8
        case .bags:
            dotCook.backgroundColor = UIColor(hexString: "FF9666")
            dotbag.backgroundColor = UIColor(hexString: "FF9666")
            lineCartCook.backgroundColor = UIColor(hexString: "FF9666")
            lineCookBag.backgroundColor = UIColor(hexString: "FF9666")
            imgCook.tintColor = UIColor(hexString: "FF9666")
            imgBag.tintColor = UIColor(hexString: "FF9666")
            imgCart.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgCart.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imgCook.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgCook.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imgBag.widthAnchor.constraint(equalToConstant: 40).isActive = true
            imgBag.heightAnchor.constraint(equalToConstant: 40).isActive = true
            marginLeftCart.constant = 4
            marginRightbag.constant = 0
        }
        
    }
    
}

