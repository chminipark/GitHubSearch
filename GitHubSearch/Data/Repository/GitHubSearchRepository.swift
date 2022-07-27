//
//  GitHubSearchRepository.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/24.
//

import Foundation
import Moya
import RxSwift

protocol GitHubSearchRepository {
    func fetchRepoList(text: String) -> Observable<[Repo]>
}

final class DefaultGitHubSearchRepository: GitHubSearchRepository {
    let provider = MoyaProvider<GitHubSearchAPI>(plugins: [GitHubSearchAPIPlugin()])
    
    func fetchRepoList(text: String) -> Observable<[Repo]> {
        return provider.rx.request(.searchRepository(text: text))
            .filter(statusCode: 200)
            .map(GitHubSearchResponseDTO.self)
            .map { $0.repositories.map { $0.toDomain() } }
            .asObservable()
    }
}
