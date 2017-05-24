//
//  SearchResponse.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/25.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation

struct SearchResponse<Item : JSONDecodable> : JSONDecodable{
    let totalCount: Int
    let items: [Item]
    
    init(json: Any) throws{
        //JSONからAnyへ
        guard let dictionary = json as? [String : Any] else{
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        //total_countを取得
        guard let totalCount = dictionary["total_count"] as? Int else{
            throw JSONDecodeError.missingValue(
                key: "total_count",
                actualValue: dictionary["total_count"])
        }
        
        //itemsをAnyの配列として取り出しitemObjectsに格納
        guard let itemObjects = dictionary["items"] as? [Any] else{
            throw JSONDecodeError.missingValue(
                key: "items",
                actualValue: dictionary["items"])
        }
        
        //itemObjectsに入っているAnyの配列をもとにインスタンスを生成
        let items = try itemObjects.map {
            return try Item(json: $0)
        }
        
        self.totalCount = totalCount
        self.items = items
    }
}
