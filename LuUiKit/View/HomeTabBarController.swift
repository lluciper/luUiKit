//
//  HomeTabBarController.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import Foundation
import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.barTintColor = UIColor.white
        setUpTabBarView()
        selectTabBar()
    }
    
    public func selectTabBar(_ index: Int = 0){
        self.selectedIndex = index
    }
    
    private func setUpTabBarView(){
        
        let vcHome = HomeViewController()
        let vcOrder = OrderViewController()
        let vcRewards = RewardsViewController()
        let vcAccount = AccountViewController()
        
        vcHome.tabBarItem.image = UIImage(named: "Home")
        vcOrder.tabBarItem.image = UIImage(named: "Orders")
        vcRewards.tabBarItem.image = UIImage(named: "Gift")
        vcAccount.tabBarItem.image = UIImage(named: "Account")
        
        vcHome.tabBarItem.title = AppLocalizable.home.localized
        vcOrder.tabBarItem.title = AppLocalizable.orders.localized
        vcRewards.tabBarItem.title = AppLocalizable.gift.localized
        vcAccount.tabBarItem.title = AppLocalizable.account.localized
        
//        let navHome = UINavigationController(rootViewController: vcHome)
//        let navOrder = UINavigationController(rootViewController: vcOrder)
//        let navRewards = UINavigationController(rootViewController: vcRewards)
//        let navAccount = UINavigationController(rootViewController: vcAccount)
//
//        navHome.isNavigationBarHidden = true
//        navOrder.isNavigationBarHidden = true
//        navRewards.isNavigationBarHidden = true
//        navAccount.isNavigationBarHidden = true
        
        tabBar.tintColor = UIColor(hexString: "FF9666")
        
        setViewControllers([vcHome, vcOrder, vcRewards, vcAccount], animated: true)
    }
    
//    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = image
//        return viewController
//    }
    
}
