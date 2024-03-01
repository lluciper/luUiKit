//
//  AccountViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var helpCenterView: UIView!
    
    @IBOutlet weak var imgAccount: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpOntapView()
        let imageURLString = "https://i.pinimg.com/originals/42/6b/d9/426bd99833a838b008ca06582d4d5b5e.jpg"
        self.imgAccount.setImage(imageURLString)
        self.imgAccount.clipsToBounds = true
        self.imgAccount.backgroundColor = UIColor(hexString: "FFE5E5")
        
    }
    
    func setUpOntapView(){
        let tapHelpCenterView = UITapGestureRecognizer(target: self, action: #selector(onHelpCenterView))
        self.helpCenterView.addGestureRecognizer(tapHelpCenterView)
    }
    
    @objc func onHelpCenterView() {
        let vc = HelpCenterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func onChangeAvatar(_ sender: Any) {
        print("Change Avatar")
    }
}
