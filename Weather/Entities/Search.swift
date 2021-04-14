//
//  Search.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class Search {
    
    var message: String?
    var code: String?
    var count: Int?
    var list: [Weather] = []
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        message = json["message"].stringValue
        code = json["cod"].stringValue
        count = json["count"].intValue
        for jsonItem in json["list"].arrayValue {
            if let item = Weather(json: jsonItem) {
                list.append(item)
            }
        }
    }
    
    func weatherIsEmpty() -> Bool {
        return list.isEmpty
    }
}
