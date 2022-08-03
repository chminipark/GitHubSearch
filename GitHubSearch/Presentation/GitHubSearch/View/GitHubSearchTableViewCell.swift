//
//  GitHubSearchTableViewCell.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/27.
//

import UIKit

final class GitHubSearchTableViewCell: UITableViewCell, CustomView {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "fullName"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        return imageView
    }()
    
    private lazy var starCountLabel: UILabel = {
        let label = UILabel()
        label.text = "starCount"
        label.textColor = .black
        return label
    }()
    
    private lazy var nameContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var starContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func setupView() {
        [nameLabel, fullNameLabel].forEach {
            nameContainerView.addSubview($0)
        }
        
        [starImageView, starCountLabel].forEach {
            starContainerView.addSubview($0)
        }
        
        [nameContainerView, starContainerView].forEach {
            self.contentView.addSubview($0)
        }
    }
    
    func setupConstraint() {
        nameContainerView.translatesAutoresizingMaskIntoConstraints = false
        nameContainerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        nameContainerView.rightAnchor.constraint(equalTo: starContainerView.leftAnchor).isActive = true
        nameContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: nameContainerView.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: nameContainerView.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: nameContainerView.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: nameContainerView.heightAnchor, multiplier: 0.6).isActive = true
        
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        fullNameLabel.leftAnchor.constraint(equalTo: nameContainerView.leftAnchor).isActive = true
        fullNameLabel.rightAnchor.constraint(equalTo: nameContainerView.rightAnchor).isActive = true
        fullNameLabel.bottomAnchor.constraint(equalTo: nameContainerView.bottomAnchor).isActive = true
        
        starContainerView.translatesAutoresizingMaskIntoConstraints = false
        starContainerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        starContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        starContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        starContainerView.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.topAnchor.constraint(equalTo: starContainerView.topAnchor).isActive = true
        starImageView.trailingAnchor.constraint(equalTo: starContainerView.trailingAnchor).isActive = true
        starImageView.widthAnchor.constraint(equalTo: starContainerView.widthAnchor).isActive = true
        starImageView.heightAnchor.constraint(equalTo: starContainerView.widthAnchor).isActive = true
        
        starCountLabel.translatesAutoresizingMaskIntoConstraints = false
        starCountLabel.topAnchor.constraint(equalTo: starImageView.bottomAnchor).isActive = true
        starCountLabel.leadingAnchor.constraint(equalTo: starContainerView.leadingAnchor).isActive = true
        starCountLabel.trailingAnchor.constraint(equalTo: starContainerView.trailingAnchor).isActive = true
        starCountLabel.bottomAnchor.constraint(equalTo: starContainerView.bottomAnchor).isActive = true
    }
}

extension GitHubSearchTableViewCell {
    func update(_ repo: Repo) {
        nameLabel.text = repo.name
        fullNameLabel.text = repo.fullName
        starCountLabel.text = String(repo.starCount)
    }
}
