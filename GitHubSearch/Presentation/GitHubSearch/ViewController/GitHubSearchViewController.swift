//
//  GitHubSearchViewController.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/15.
//

import UIKit
import RxSwift
import RxCocoa
import Moya

final class GitHubSearchViewController: UIViewController {
    let gitHubSearchView = GitHubSearchView()
    let gitHubSearchViewModel = GitHubSearchViewModel(
        gitHubSearchUseCase: GitHubSearchUseCase(
            gitHubSearchRepository: DefaultGitHubSearchRepository()
        )
    )
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private lazy var input = GitHubSearchViewModel.Input(
        searchBarText: searchController.searchBar.rx.text.orEmpty.asDriver()
    )
    private lazy var output = gitHubSearchViewModel.transform(input: input)
    
    let disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        view = gitHubSearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bind()
    }
    
    private func setup() {
        view.backgroundColor = .white
        self.navigationItem.title = "GitHub Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        configureSearchBar()
    }
    
    private func configureSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    private func bind() {
        output.repoList
            .drive(gitHubSearchView.tableView.rx.items(
                cellIdentifier: Constant.View.gitHubSearchTableViewCell,
                cellType: GitHubSearchTableViewCell.self)
            ) { (index: Int, data: Repo, cell: GitHubSearchTableViewCell) in
                var content = cell.defaultContentConfiguration()
                content.text = data.fullName
                cell.contentConfiguration = content
            }
            .disposed(by: disposeBag)
    }
}
