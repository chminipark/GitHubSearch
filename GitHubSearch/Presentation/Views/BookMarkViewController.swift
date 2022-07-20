//
//  BookMarkViewController.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/18.
//

import UIKit

class BookMarkViewController: UIViewController {
    
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
        view.backgroundColor = .white
        navigationItem.title = "BookMark"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureTableView()
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

extension BookMarkViewController: UITableViewDelegate, UITableViewDataSource {
    
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

