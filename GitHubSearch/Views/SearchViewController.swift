//
//  SearchViewController.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/15.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var tableView: UITableView!
    
    let data: Array<String> = {
        var data = [String]()
        for i in stride(from: 1, through: 50, by: 1) {
            data.append(String(i))
        }
        return data
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "GitHub Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        configureSearchBar()
        configureTableView()
    }
    
    private func configureSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    private func configureTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = data[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
}
