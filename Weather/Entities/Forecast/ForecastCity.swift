//
//  ForecastCity.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class ForecastCity {
    
    let id: Int?
    let name: String?
    let coordinate: WeatherCoordinate?
    let country: String?
    let timezone: Int?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        id = json["id"].intValue
        name = json["name"].stringValue
        coordinate = WeatherCoordinate(json: json["coord"])
        country = json["country"].stringValue
        timezone = json["timezone"].intValue
    }
}
