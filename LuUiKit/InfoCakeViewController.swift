//
//  InfoCakeViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 08/01/2024.
//

import UIKit

class InfoCakeViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapBackView = UITapGestureRecognizer(target: self, action: #selector(onBack(_:)))
        self.backView.addGestureRecognizer(tapBackView)
    }
    
    @objc func onBack (_ sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }

}
