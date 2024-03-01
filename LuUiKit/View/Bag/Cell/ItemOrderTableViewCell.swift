//
//  ItemOrderTableViewCell.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import UIKit

class ItemOrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var imgItem: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
