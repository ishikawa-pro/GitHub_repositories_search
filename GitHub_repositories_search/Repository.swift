//
//  Repository.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/21.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation

//リポジトリ情報を格納する構造体
struct Repository {
    let id: Int
    let name: String
    let fullName: String
    let htmlUrl: String
    let description: String
    let owner: User
}
