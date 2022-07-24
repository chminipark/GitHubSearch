//
//  Repo.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/24.
//

import Foundation

struct GitHubRepoSearchResponse: Decodable {
    let repositories: [Repo]
    
    private enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}

struct Repo: Decodable {
    let name: String
    let fullName: String
    let starCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case starCount = "stargazers_count"
    }
}
