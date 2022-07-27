//
//  GitHubSearchViewModel.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/20.
//

import Foundation
import RxCocoa
import RxSwift

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
    var disposeBag: DisposeBag { get }
}

class GitHubSearchViewModel: ViewModel {
    let gitHubSearchUseCase: GitHubSearchUseCase
    let disposeBag = DisposeBag()
    
    let repoList = BehaviorRelay<[Repo]>(value: [])
    
    init(gitHubSearchUseCase: GitHubSearchUseCase) {
        self.gitHubSearchUseCase = gitHubSearchUseCase
    }
    
    func transform(input: Input) -> Output {
        input.searchBarText
            .debounce(.seconds(1))
            .filter { $0 != "" }
            .drive(with: self) { owner, text in
                owner.searchRepo(text: text)
            }
            .disposed(by: disposeBag)
        
        return Output(repoList: repoList.asDriver())
    }
}

extension GitHubSearchViewModel {
    struct Input {
        let searchBarText: Driver<String>
    }
    
    struct Output {
        let repoList: Driver<[Repo]>
    }
}

extension GitHubSearchViewModel {
    func searchRepo(text: String) {
        gitHubSearchUseCase.execute(text: text)
            .withUnretained(self)
            .subscribe(onNext: { owner, data in
                owner.repoList.accept(data)
            })
            .disposed(by: disposeBag)
    }
}
