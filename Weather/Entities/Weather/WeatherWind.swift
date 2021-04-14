//
//  WeatherWind.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class WeatherWind {
    
    var speed: Double?
    var direction: Int?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        speed = json["speed"].doubleValue
        direction = json["deg"].intValue
    }
}
