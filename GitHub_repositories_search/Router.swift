//
//  Router.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/28.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation
import Alamofire

//URLRequestを生成する。
//エンドポイントを追加する際はこちらへ追加する
enum GitHubAPIRouter: GitHubRequest, URLRequestConvertible{
    //リポジトリ検索
    case searchRepositories(parameters: String )    
    
    var method: HTTPMethod{
        switch self {
        case .searchRepositories:
            return .get
        }
    }
    
    var path: String{
        switch self {
        case .searchRepositories:
            return "/search/repositories"
        }
    }
    
    var parameters: Parameters?{
        switch self {
        case .searchRepositories(let parameters):
            return ["q": parameters] as Parameters
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .searchRepositories:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
    
}
