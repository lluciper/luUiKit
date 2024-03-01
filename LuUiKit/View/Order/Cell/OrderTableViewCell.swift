//
//  OrderTableViewCell.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataView: UIView!
    
    var listItemLabel: [String] = []
    
    @IBOutlet weak var tableLabel: UITableView!{
        didSet{
            tableLabel.register(UINib(nibName: "ItemLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemLabelTableViewCell")
            tableLabel.dataSource = self
            tableLabel.delegate = self
        }
    }
    @IBOutlet weak var dataRightView: UIView!
    @IBOutlet weak var dataLeftView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension OrderTableViewCell:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItemLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelTableViewCell", for: indexPath) as! ItemLabelTableViewCell
        cell.itemLabel.text = listItemLabel[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 18
    }
}
