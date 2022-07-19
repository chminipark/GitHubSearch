//
//  SearchViewController.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/15.
//

import UIKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        self.navigationItem.title = "GitHub Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setSearchBar()
    }
    
    private func setSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}
