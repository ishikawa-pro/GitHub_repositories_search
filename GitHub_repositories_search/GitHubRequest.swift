//
//  GitHubRequest.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/27.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation
import Alamofire


//リクエストを表す型
protocol GitHubRequest {
    var baseURL: URL { get }
    var path: String{ get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
}

//baseURLは全てのリクエストで共通なのでextensionでデフォルト実装
extension GitHubRequest{
    var baseURL: URL{
        return URL(string: "https://api.github.com")!
    }
}
