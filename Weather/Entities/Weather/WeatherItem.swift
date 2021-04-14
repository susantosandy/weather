//
//  WeatherItem.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class WeatherItem {
    
    var id: Int?
    var main: String?
    var icon: String?
    var description: String?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        id = json["id"].intValue
        main = json["main"].stringValue
        icon = json["icon"].stringValue
        description = json["description"].stringValue
    }
}
