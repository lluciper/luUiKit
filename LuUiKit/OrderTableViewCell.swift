//
//  OrderTableViewCell.swift
//  LuUiKit
//
//  Created by VN Savis on 26/01/2024.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelOrderTable: UITableView!
    @IBOutlet weak var dataView: UIView!
    
    @IBOutlet weak var dataRightView: UIView!
    @IBOutlet weak var dataLeftView: UIView!
    var order : [String] = ["aaaaa", "bbbbbb", "cccccc", "dddddd"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension OrderTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == labelOrderTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "labelOrderTable", for: indexPath) as! LabelOrderTableViewCell
     
            return cell
        }
        return UITableViewCell()
        
    }
    
    
}
