//
//  WeatherCoordinate.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class WeatherCoordinate {
    
    var longitude: Double?
    var latitude: Double?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        longitude = json["lon"].doubleValue
        latitude = json["lat"].doubleValue
    }
}
