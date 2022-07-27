//
//  GitHubSearchResponseDTO+Mapping.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/25.
//

import Foundation

struct GitHubSearchResponseDTO: Decodable {
    let repositories: [RepoDTO]
    
    private enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}

extension GitHubSearchResponseDTO {
    struct RepoDTO: Decodable {
        let name: String
        let fullName: String
        let starCount: Int
        
        private enum CodingKeys: String, CodingKey {
            case name
            case fullName = "full_name"
            case starCount = "stargazers_count"
        }
    }
}

extension GitHubSearchResponseDTO.RepoDTO {
    func toDomain() -> Repo {
        return .init(
            name: name,
            fullName: fullName,
            starCount: starCount
        )
    }
}
