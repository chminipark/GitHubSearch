//
//  GitHubSearchView.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/20.
//

import UIKit

protocol CustomView {
    func setupView()
    func setupConstraint()
}

final class GitHubSearchView: UIView, CustomView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            GitHubSearchTableViewCell.self,
            forCellReuseIdentifier: Constant.View.gitHubSearchTableViewCell
        )
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func setupView() {
        [tableView].forEach {
            addSubview($0)
        }
    }
    
    func setupConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
