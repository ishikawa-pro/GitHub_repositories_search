//
//  HTTPMethod.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/28.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation

//どのように操作するか指定する
//とりあえずGETとPOSTのみ
enum HTTPMethod : String{
    case get = "GET"
    case post = "POST"
}
