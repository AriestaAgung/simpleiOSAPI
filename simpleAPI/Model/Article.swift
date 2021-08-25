//
//  Article.swift
//  simpleAPI
//
//  Created by odikk on 25/08/21.
//

import Foundation
import SwiftyJSON


struct Article{
    var userID: Int?
    var id: Int?
    var title: String?
    var body: String
    
    init(json: JSON) {
        userID = json["userId"].intValue
        id = json["id"].intValue
        title = json["title"].stringValue
        body = json["body"].stringValue
    }
    
}

