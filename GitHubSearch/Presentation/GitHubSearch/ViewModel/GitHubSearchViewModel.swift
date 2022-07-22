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
}

class GitHubSearchViewModel: ViewModel {
    func transform(input: Input) -> Output {
        
        let testText = input.searchBarText
            .debounce(.seconds(1))
            .filter { $0 != "" }
        
        return Output(testText: testText)
    }
}

extension GitHubSearchViewModel {
    
    struct Input {
        let searchBarText: Driver<String>
    }
    
    struct Output {
        let testText: Driver<String>
    }
    
}
