//
//  SearchDAO.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class SearchDAO: BaseDAO {
    
    var search: Search?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        search = Search(json: json)
    }
}
