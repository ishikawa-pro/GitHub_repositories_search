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
struct User : JSONDecodable{
    let id: Int
    let name: String
    let avatarUrl: String
    
    init(json: Any) throws{
        
        //JSONからAnyへ
        guard let dictionary = json as? [String : Any] else{
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        //Anyからidを取り出す
        guard let id = dictionary["id"] as? Int else {
            throw JSONDecodeError.missingValue(
                key: "id", actualValue: dictionary["id"])
        }
        
        //Anyからnameを取り出す
        guard let name = dictionary["name"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "name", actualValue: dictionary["name"])
        }
        
        //Anyからavatar_urlを取り出す
        guard let avatarUrl = dictionary["avatar_url"] as? String else {
            throw JSONDecodeError.missingValue(
                key: "avatarUrl", actualValue: dictionary["avatar_url"])
        }
        
        self.id = id
        self.name = name
        self.avatarUrl = avatarUrl
    }
}
