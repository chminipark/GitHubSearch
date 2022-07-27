//
//  GitHubSearchAPI.swift
//  GitHubSearch
//
//  Created by chmini on 2022/07/22.
//

import Foundation
import Moya

enum GitHubSearchAPI {
    case searchRepository(text: String)
}

extension GitHubSearchAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        "/search/repositories"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .searchRepository(let text):
            let params: [String: String] = [
                "q": text
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return .none
    }
}

final class GitHubSearchAPIPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        print("😈😈😈 URL : \(request.request?.url?.description ?? "")")
    }
}
