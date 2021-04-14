//
//  WeatherSys.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class WeatherSys {
    
    var message: Double?
    var country: String?
    var sunset: Int64?
    var sunrise: Int64?
    var pod: String?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        message = json["message"].doubleValue
        country = json["country"].stringValue
        sunset = json["sunset"].int64Value
        sunrise = json["sunrise"].int64Value
        pod = json["pod"].stringValue
    }
}
