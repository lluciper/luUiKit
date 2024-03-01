//
//  ItemLabelTableViewCell.swift
//  LuUiKit
//
//  Created by VN Savis on 19/02/2024.
//

import UIKit

class ItemLabelTableViewCell: UITableViewCell {

    
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
