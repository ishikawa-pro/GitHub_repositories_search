//
//  GitHubAPI.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/28.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation

//リクエストを表す型をグルーピング
//今後SearchRepositories以外のGitHubSearchAPIのエンドポイント追加する際はリクエストを表す型をここへ入れる
struct GitHubAPI{
    struct SearchRepositories : GitHubRequest {
        let keyword : String
        
        typealias Response = SearchResponse<Repository>
        var method: HTTPMethod{
            return .get;
        }
        
        var path: String{
            return "/search/repositories"
        }
        
        var parameters: Any?{
            return ["q": keyword]
        }
    }
}
