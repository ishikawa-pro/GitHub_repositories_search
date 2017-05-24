//
//  JSONDecodable.swift
//  GitHub_repositories_search
//
//  Created by 石川諒 on 2017/05/22.
//  Copyright © 2017年 石川諒. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(json: Any) throws
}
