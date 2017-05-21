//
//  User.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/21.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation

//リポジトリのOwnerの情報を格納する構造体
//とりあえずid, name, avatar画像のurlのみ
struct User {
    let id: Int
    let name: String
    let avatarUrl: String
}
