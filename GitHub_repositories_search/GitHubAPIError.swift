//
//  GitHubAPIError.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/25.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation

//リクエストが不正な場合のエラーレスポンスの構造体
struct GitHubAPIError : JSONDecodable, Error {
    //エラーレスポンスのerrorsプロパティの要素をモデル化
    struct FieldError : JSONDecodable {
        let resource: String
        let field: String
        let code: String
        
        init(json: Any) throws {
            guard let dictionary = json as? [String : Any] else {
                throw JSONDecodeError.invalidFormat(json: json)
            }
            
            guard let resource = dictionary["resource"] as? String else{
                throw JSONDecodeError.missingValue(key: "resource", actualValue: json)
            }
            
            guard let field = dictionary["field"] as? String else{
                throw JSONDecodeError.missingValue(
                    key: "field",
                    actualValue: dictionary["field"])
            }
            
            guard let code = dictionary["code"] as? String else{
                throw JSONDecodeError.missingValue(
                    key: "code",
                    actualValue: dictionary["code"])
            }
            
            self.resource = resource
            self.field = field
            self.code = code
        }
    }
    
    let message: String
    let fieldErrors: [FieldError]
    
    init(json: Any) throws{
        guard let dictionary = json as? [String : Any] else{
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let message = dictionary["message"] as? String else{
            throw JSONDecodeError.missingValue(
                key: "message",
                actualValue: dictionary["message"])
        }
        
        //errorsがnilなら空の配列で初期化
        let fieldErrorObjects = dictionary["errors"] as? [Any] ?? []
        //errors中身の数だけFieldError型のインスタンスを作成してfieldErrorsへ格納
        let fieldErrors = try fieldErrorObjects.map{
            return try FieldError(json: $0)
        }
        self.message = message
        self.fieldErrors = fieldErrors
    }
}
