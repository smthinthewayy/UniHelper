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
        
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let item1 = UniversitiesViewController()
        let item2 = ServicesViewController()
        let item3 = ProfileViewController()
        
        let icon1 = UITabBarItem(title: "Search", image: UIImage(systemName: "house.fill"), selectedImage: UIImage(systemName: "house"))
        let icon2 = UITabBarItem(title: "Services", image: UIImage(systemName: "book.fill"), selectedImage: UIImage(systemName: "book"))
        let icon3 = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), selectedImage: UIImage(systemName: "person"))
        
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        item3.tabBarItem = icon3
        
        let controllers = [item1, item2, item3]
        
        self.viewControllers = controllers
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        title = viewController.title
        return true;
    }
}
