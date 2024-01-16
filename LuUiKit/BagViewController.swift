//
//  BagViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 15/01/2024.
//

import UIKit

class BagViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BagViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemOderCell", for: indexPath) as! ItemOrderTableViewCell
        
        let imageURLString = "https://anhdephd.vn/wp-content/uploads/2022/03/hinh-anh-anime-nam-ngau.jpg"
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
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "infoCakeViewController") as! InfoCakeViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

