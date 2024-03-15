//
//  LoginViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import UIKit
//import IOSSecuritySuite
import RxSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var viewSignUp: UIView!
    @IBOutlet weak var viewSignIn: UIView!
    @IBOutlet weak var labelSignup: UILabel!
    @IBOutlet weak var labelSignIn: UILabel!
    @IBOutlet weak var tfEmail: TextField!
    @IBOutlet weak var tfPassword: TextField!
    @IBOutlet weak var viewForgotPassword: UIView!
    @IBOutlet weak var viewConfirmPassword: UIView!
    @IBOutlet weak var tfConfirmPassword: TextField!
    @IBOutlet weak var btnSignInUp: UIButton!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    
    //    func isRunningOnSimulator() -> Bool {
//        #if targetEnvironment(simulator)
//            return true
//        #else
//            return false
//        #endif
//    }
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languageApp =  UserDefaults.standard.string(forKey: LocalizeDefaultLanguageKey) ?? "en"
        
        setUpNSLocalizedString()

//        if isRunningOnSimulator() {
//            print("Ứng dụng đang chạy trên máy ảo (simulator).")
//        } else {
//            print("Ứng dụng đang chạy trên máy thật (physical device).")
//        }
//        
//        if IOSSecuritySuite.amIJailbroken() {
//            print("This device is jailbroken")
//        } else {
//            print("This device is not jailbroken")
//        }
//        
//        if IOSSecuritySuite.amIRunInEmulator() {
//            print("This is Emulator")
//        } else {
//            print("This is not Emulator")
//        }
        self.navigationController?.isNavigationBarHidden = true
        
        setupView()
        
        let tapViewSignIn = UITapGestureRecognizer(target: self, action: #selector(onChooseSignIn(_:)))
        let tapViewSignUp = UITapGestureRecognizer(target: self, action: #selector(onChooseSignUp(_:)))
        self.viewSignIn.addGestureRecognizer(tapViewSignIn)
        self.viewSignUp.addGestureRecognizer(tapViewSignUp)
    }
    
    func setUpNSLocalizedString(){
        labelSignIn.text = AppLocalizable.signIn.localized
        labelSignup.text = AppLocalizable.signUp.localized
        forgotPasswordLabel.text = AppLocalizable.forgotPassword.localized
        orLabel.text = AppLocalizable.or.localized
        tfEmail.placeholder = AppLocalizable.email.localized
        tfPassword.placeholder = AppLocalizable.password.localized
        tfConfirmPassword.placeholder = AppLocalizable.confirmPassword.localized
    }
    
    func setupView(){
        changeChooseSignInAndSignUp(true)
        tfPassword.isSecureTextEntry = true
               let toggleButtonPassword = UIButton(type: .custom)
        toggleButtonPassword.setImage(UIImage(named: "eye_open"), for: .normal)
        toggleButtonPassword.setImage(UIImage(named: "eye_closed"), for: .selected)
        toggleButtonPassword.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        tfPassword.rightView = toggleButtonPassword
        tfPassword.rightViewMode = .always
        
        tfConfirmPassword.isSecureTextEntry = true
               let toggleButtonConfirmPassword = UIButton(type: .custom)
        toggleButtonConfirmPassword.setImage(UIImage(named: "eye_open"), for: .normal)
        toggleButtonConfirmPassword.setImage(UIImage(named: "eye_closed"), for: .selected)
        toggleButtonConfirmPassword.addTarget(self, action: #selector(toggleConfirmPasswordVisibility), for: .touchUpInside)
        tfConfirmPassword.rightView = toggleButtonConfirmPassword
        tfConfirmPassword.rightViewMode = .always
    }
    
    @objc func togglePasswordVisibility() {
        tfPassword.isSecureTextEntry.toggle()
    }
    
    @objc func toggleConfirmPasswordVisibility() {
        tfConfirmPassword.isSecureTextEntry.toggle()
    }
    
    @objc func onChooseSignIn (_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.view?.backgroundColor = AppColor.origin
        }) { (completed) in
            self.changeChooseSignInAndSignUp(true)
        }
    }
    
    @objc func onChooseSignUp (_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.view?.backgroundColor = AppColor.origin
        }) { (completed) in
            self.changeChooseSignInAndSignUp(false)
        }
    }
    
    func changeChooseSignInAndSignUp(_ isChoose: Bool){
        
        if isChoose {
            self.viewSignIn.backgroundColor = AppColor.origin
            self.labelSignIn.textColor = AppColor.white
            self.viewSignUp.backgroundColor = AppColor.transparent
            self.labelSignup.textColor = AppColor.origin
            self.viewForgotPassword.isHidden = false
            self.viewConfirmPassword.isHidden = true
            self.btnSignInUp.setTitle(AppLocalizable.signIn.localized, for: .normal)
        } else {
            self.viewSignUp.backgroundColor = AppColor.origin
            self.labelSignup.textColor = AppColor.white
            self.viewSignIn.backgroundColor = AppColor.transparent
            self.labelSignIn.textColor = AppColor.origin
            self.viewForgotPassword.isHidden = true
            self.viewConfirmPassword.isHidden = false
            self.btnSignInUp.setTitle(AppLocalizable.signUp.localized, for: .normal)
        }
        
    }
    
    @IBAction func onSignInOrUp(_ sender: Any) {
        let vc = HomeTabBarController()
//        let vc = QTViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

