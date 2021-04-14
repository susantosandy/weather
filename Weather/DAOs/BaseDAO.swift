//
//  BaseDAO.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class BaseDAO {
    
    var error: ErrorExceptionAPI?
    
    init(json: JSON? = nil) {
        guard let json = json else {
            return
        }
        if json["error"].exists() || (json["cod"].exists() && json["message"].exists()) {
            error = ErrorExceptionAPI(json: json)
        }
    }
    
    func isError() -> Bool {
        if let error = error?.codInt, error == 200 {
            return false
        }
        
        if let error = error?.codString, error == "200" {
            return false
        }
        
        return error != nil
    }
}
