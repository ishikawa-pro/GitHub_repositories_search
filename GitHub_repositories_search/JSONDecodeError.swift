//
//  JSONDecodeError.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/21.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation

//JSONからインスタンスの生成に失敗した時の状況を表す列挙型
enum JSONDecodeError : Error{
    //JSONの構造が期待しているものと異なっている状態
    case invalidFormat(json: Any)
    //初期化に必要なキーに対する値がJSONに存在しないか、プロパティの型と異なる場合
    case missingValue(key: String, actualValue: Any?)
}
