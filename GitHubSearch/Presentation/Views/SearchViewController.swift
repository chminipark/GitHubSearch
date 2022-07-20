//
//  SearchViewController.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/15.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    
    private var tableView: UITableView!
    private var searchController: UISearchController!
    
    let disposeBag = DisposeBag()
    
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
        
        searchController.searchBar.rx.text
            .subscribe(onNext: { text in
                print(text)
            })
            .disposed(by: disposeBag)
    }
    
    private func setUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "GitHub Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        configureSearchBar()
        configureTableView()
    }
    
    private func configureSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    private func configureTableView() {
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
