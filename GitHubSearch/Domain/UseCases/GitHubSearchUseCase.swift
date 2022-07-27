//
//  GitHubSearchUseCase.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/25.
//

import Foundation
import RxSwift

class GitHubSearchUseCase {
    let gitHubSearchRepository: GitHubSearchRepository
    
    init(gitHubSearchRepository: GitHubSearchRepository) {
        self.gitHubSearchRepository = gitHubSearchRepository
    }
    
    func execute(text: String) -> Observable<[Repo]> {
        return gitHubSearchRepository.fetchRepoList(text: text)
    }
}
