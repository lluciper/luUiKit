//
//  BagViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import UIKit

class BagViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView! {
        didSet{
            cartTableView.register(UINib(nibName: "ItemOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemOrderTableViewCell")
            cartTableView.dataSource = self
            cartTableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BagViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemOrderTableViewCell", for: indexPath) as! ItemOrderTableViewCell
        
        let imageURLString = "https://i.pinimg.com/originals/42/6b/d9/426bd99833a838b008ca06582d4d5b5e.jpg"
        cell.imgItem.setImage(imageURLString)
        cell.imgItem.layer.cornerRadius = 4
        cell.imgItem.clipsToBounds = true
        cell.imgItem.backgroundColor = UIColor(hexString: "FFE5E5")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
    
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}

