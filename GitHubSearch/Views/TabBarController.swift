//
//  TabBarController.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/17.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let bookMarkViewController = UINavigationController(rootViewController: BookMarkViewController())
        
        searchViewController.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        bookMarkViewController.tabBarItem = UITabBarItem(
            title: "BookMark",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        self.viewControllers = [searchViewController, bookMarkViewController]
    }
    
}
