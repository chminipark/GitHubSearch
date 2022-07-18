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
        
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let bookMarkViewController = BookMarkViewController()
        bookMarkViewController.tabBarItem = UITabBarItem(
            title: "BookMark",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        
        self.viewControllers = [searchViewController, bookMarkViewController]
        
    }
}
