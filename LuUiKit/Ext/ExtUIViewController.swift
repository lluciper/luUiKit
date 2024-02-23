//
//  ExtUiViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 04/01/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func navPushViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navPopToRootViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func navPopViewController(){
        navigationController?.popViewController(animated: true)
    }
    
    func navPopToViewController(_ viewController: UIViewController){
        navigationController?.popToViewController(viewController, animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func hideKeyboardAndTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    if let viewControllers = self.navigationController?.viewControllers {
//        for viewController in viewControllers {
//            if viewController is SetupPinViewController {
//                self.navPopToViewController(viewController)
//                break
//            }
//        }
//    }
}
