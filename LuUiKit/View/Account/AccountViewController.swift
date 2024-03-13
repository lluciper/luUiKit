//
//  AccountViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var helpCenterView: UIView!
    @IBOutlet weak var accountSettingsView: UIView!
    @IBOutlet weak var favoritesView: UIView!
    @IBOutlet weak var notificationsView: UIView!
    @IBOutlet weak var signOutView: UIView!
    
    @IBOutlet weak var imgAccount: UIImageView!
    @IBOutlet weak var imgSelectLanguageEn: UIImageView!
    @IBOutlet weak var imgSelectLanguageVi: UIImageView!
    @IBOutlet weak var viewLanguageVi: UIView!
    @IBOutlet weak var viewLanguageEn: UIView!
    
    let isSelectLanguageEn: Bool = languageApp == "en"
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setIamgeSelectLanguage()
        setUpOntapView()
    }
    
    func setUpView(){
        let imageURLString = "https://i.pinimg.com/originals/42/6b/d9/426bd99833a838b008ca06582d4d5b5e.jpg"
        self.imgAccount.setImage(imageURLString)
        self.imgAccount.clipsToBounds = true
        self.imgAccount.backgroundColor = UIColor(hexString: "FFE5E5")
    }
    
    func setIamgeSelectLanguage(){
        imgSelectLanguageVi.image = !isSelectLanguageEn ? UIImage(named: "LanguageSuccess") : UIImage(named: "LanguageNotSuccess")
        imgSelectLanguageEn.image = isSelectLanguageEn ? UIImage(named: "LanguageSuccess") : UIImage(named: "LanguageNotSuccess")
    }
    
    func setUpOntapView(){
        let tapHelpCenterView = UITapGestureRecognizer(target: self, action: #selector(onHelpCenterView))
        let tapAccountSettingsView = UITapGestureRecognizer(target: self, action: #selector(onAccountSettingsView))
        let tapFavoritesView = UITapGestureRecognizer(target: self, action: #selector(onFavoritesView))
        let tapNotificationsView = UITapGestureRecognizer(target: self, action: #selector(onNotificationsView))
        let tapSignOutView = UITapGestureRecognizer(target: self, action: #selector(onSignOutView))
        
        self.helpCenterView.addGestureRecognizer(tapHelpCenterView)
        self.accountSettingsView.addGestureRecognizer(tapAccountSettingsView)
        self.favoritesView.addGestureRecognizer(tapFavoritesView)
        self.notificationsView.addGestureRecognizer(tapNotificationsView)
        self.signOutView.addGestureRecognizer(tapSignOutView)
        
        let tapLanguageVi = UITapGestureRecognizer(target: self, action: #selector(onSelectLanguageVi))
        let tapLanguageEn = UITapGestureRecognizer(target: self, action: #selector(onSelectLanguageEn))
        
        self.viewLanguageVi.addGestureRecognizer(tapLanguageVi)
        self.viewLanguageEn.addGestureRecognizer(tapLanguageEn)
    }
    
    @objc func onHelpCenterView() {
        let vc = HelpCenterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onAccountSettingsView() {
    }
    
    @objc func onFavoritesView() {
    }
    
    @objc func onNotificationsView() {
    }
    
    @objc func onSignOutView() {
    }
    
    @objc func onSelectLanguageVi() {
        UserDefaults.standard.setValue("vi", forKey: LocalizeDefaultLanguageKey)
        restartAppToChangeLanguage("vi")
    }
    
    @objc func onSelectLanguageEn() {
        UserDefaults.standard.setValue("en", forKey: LocalizeDefaultLanguageKey)
        restartAppToChangeLanguage("en")
    }
    
    func restartAppToChangeLanguage(_ language: String) {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.popToRootViewController(animated: false)
        }
        languageApp = language
        let rootViewController = UINavigationController(rootViewController: LoginViewController())
        rootViewController.isNavigationBarHidden = true
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    @IBAction func onChangeAvatar(_ sender: Any) {
        print("Change Avatar")
    }
    

}
