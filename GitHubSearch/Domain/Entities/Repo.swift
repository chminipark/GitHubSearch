//
//  Repo.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/24.
//

import Foundation

struct Repo: Decodable {
    let totalCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
    }
}
