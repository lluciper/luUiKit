//
//  CakeTableViewCell.swift
//  LuUiKit
//
//  Created by VN Savis on 06/01/2024.
//

import UIKit

class CakeTableViewCell: UITableViewCell {

    @IBOutlet weak var cakeLabel: UILabel!
    @IBOutlet weak var cakeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
