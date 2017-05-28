//
//  Repository.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/21.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation

//リポジトリ情報を格納する構造体
struct Repository : JSONDecodable{
    let id: Int
    let name: String
    let fullName: String
    let htmlUrl: String
    let description: String
    let owner: User
    
    init(json: Any) throws{
        //JSONからAnyへ
        guard let dictionary = json as? [String : Any] else{
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        //idの取得
        guard let id = dictionary["id"] as? Int else{
            throw JSONDecodeError.missingValue(key: "id", actualValue: dictionary["id"])
        }
        
        //nameの取得
        guard let name = dictionary["name"] as? String else{
            throw JSONDecodeError.missingValue(key: "name", actualValue: dictionary["name"])
        }
        
        //full_nameの取得
        guard let fullName = dictionary["full_name"] as? String else{
            throw JSONDecodeError.missingValue(key: "fullName", actualValue: dictionary["full_name"])
        }
        
        //html_urlの取得
        guard let htmlUrl = dictionary["html_url"] as? String else{
            throw JSONDecodeError.missingValue(key: "htmlUrl", actualValue: dictionary["html_url"])
        }
        
        //descriptionの取得
        //descriptionは書かれていない場合があるのでnilだった場合は""を代入
        let description = dictionary["description"] as? String ?? ""

        
        //ownerの取得
        guard let ownerObject = dictionary["owner"] else{
            throw JSONDecodeError.missingValue(key: "owner", actualValue: dictionary["owner"])
        }
        
        self.id = id
        self.name = name
        self.fullName = fullName
        self.htmlUrl = htmlUrl
        self.description = description
        self.owner = try User(json: ownerObject)
    }
    
}
