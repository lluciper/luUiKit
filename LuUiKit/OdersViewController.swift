//
//  OdersViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 15/01/2024.
//

import UIKit
import SwiftSVG

class OdersViewController: UIViewController {
    
    @IBOutlet weak var oderTable: UITableView!
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
    
    var order : [String] = ["aaaaa", "bbbbbb", "cccccc", "dddddd"]
    
//    cellItemOrder
//    cellItemLabelOrder
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onChangeStatusOder(.cooks)
        
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
            imgCart.widthAnchor.constraint(equalToConstant: 36).isActive = true
            imgCart.heightAnchor.constraint(equalToConstant: 36).isActive = true
            imgCook.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgCook.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imgBag.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgBag.heightAnchor.constraint(equalToConstant: 24).isActive = true
            marginLeftCart.constant = -2
            marginRightbag.constant = 6
        case .cooks:
            dotCook.backgroundColor = UIColor(hexString: "FF9666")
            dotbag.backgroundColor = UIColor(hexString: "D9D9D9")
            lineCartCook.backgroundColor = UIColor(hexString: "FF9666")
            lineCookBag.backgroundColor = UIColor(hexString: "D9D9D9")
            imgCook.tintColor = UIColor(hexString: "FF9666")
            imgBag.tintColor = UIColor(hexString: "D9D9D9")
            imgCart.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgCart.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imgCook.widthAnchor.constraint(equalToConstant: 36).isActive = true
            imgCook.heightAnchor.constraint(equalToConstant: 36).isActive = true
            imgBag.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imgBag.heightAnchor.constraint(equalToConstant: 24).isActive = true
            marginLeftCart.constant = 4
            marginRightbag.constant = 6
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
            imgBag.widthAnchor.constraint(equalToConstant: 36).isActive = true
            imgBag.heightAnchor.constraint(equalToConstant: 36).isActive = true
            marginLeftCart.constant = 4
            marginRightbag.constant = 2
        }
        
    }
    
}

extension OdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == oderTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellItemOrder", for: indexPath) as! OrderTableViewCell
            cell.dataLeftView.clipsToBounds = true
            cell.dataRightView.clipsToBounds = true
            cell.dataView.layer.masksToBounds = false
            cell.dataView.layer.cornerRadius = 20
            cell.dataView.layer.shadowColor = UIColor.red.cgColor
            cell.dataView.layer.shadowOffset = CGSize(width: 0, height: 2)
            cell.dataView.layer.shadowOpacity = 0.1
            cell.dataView.layer.shadowRadius = 1
            cell.dataView.layer.shadowPath = UIBezierPath(roundedRect: cell.dataView.bounds, cornerRadius: cell.dataView.layer.cornerRadius).cgPath
            cell.dataView.layer.shouldRasterize = true
            cell.dataView.layer.rasterizationScale = UIScreen.main.scale
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

