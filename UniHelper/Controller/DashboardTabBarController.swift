//
//  DashboardTabBarController.swift
//  UniHelper
//
//  Created by Danila Belyi on 01.12.2022.
//

import UIKit

class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        hidesBottomBarWhenPushed = true
        
        UITabBar.appearance().tintColor = UIColor(named: "Grey")

        delegate = self
        
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: SearchViewController(), title: NSLocalizedString("Поиск", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: ServicesViewController(), title: NSLocalizedString("Сервисы", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: ProfileViewController(), title: NSLocalizedString("Профиль", comment: ""), image: UIImage(systemName: "person")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navController
    }
}
