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

class GitHubSearchViewController: UIViewController {
    
    lazy var gitHubSearchView = GitHubSearchView()
    lazy var gitHubSearchViewModel = GitHubSearchViewModel()
    lazy var searchController = UISearchController(searchResultsController: nil)
    
    private lazy var input = GitHubSearchViewModel.Input(
        searchBarText: searchController.searchBar.rx.text.orEmpty.asDriver()
    )
    private lazy var output = gitHubSearchViewModel.transform(input: input)
    
    let disposeBag = DisposeBag()
    
    let data: Array<String> = {
        var data = [String]()
        for i in stride(from: 1, through: 50, by: 1) {
            data.append(String(i))
        }
        return data
    }()
    
    override func loadView() {
        super.loadView()
        view = gitHubSearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bind()
        
//        let provider = MoyaProvider<GitHubSearchAPI>(plugins: [GitHubSearchAPIPlugin()])
//        let searchText = "RxSwift"
//        provider.request(.searchRepo(text: searchText)) { result in
//            switch result {
//            case .success(let response):
//                let decoded = try? response.map(GitHubRepoSearchResponse.self)
//                print(decoded?.repositories.first?.fullName)
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    private func setup() {
        view.backgroundColor = .white
        self.navigationItem.title = "GitHub Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        configureSearchBar()
        configureGitHubSearchView()
    }
    
    private func configureSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    private func configureGitHubSearchView() {
        gitHubSearchView.tableView.delegate = self
        gitHubSearchView.tableView.dataSource = self
    }
    
    private func bind() {
        output.testText
            .drive(onNext: { text in
                print(text)
            })
            .disposed(by: disposeBag)
    }
    
}

extension GitHubSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = data[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
}
