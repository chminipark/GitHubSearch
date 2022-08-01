//
//  GitHubSearchTableViewCell.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/27.
//

import UIKit

final class GitHubSearchTableViewCell: UITableViewCell {
    func update(_ repo: Repo) {
        var content = defaultContentConfiguration()
        content.text = repo.name
        content.secondaryText = repo.fullName
        contentConfiguration = content
        
        let image = UIImage(systemName: "star")
        accessoryView = UIImageView(image: image)
    }
}
