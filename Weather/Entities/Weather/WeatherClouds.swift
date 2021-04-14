//
//  WeatherClouds.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class WeatherClouds {
    
    var all: Int?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        all = json["all"].intValue
    }
}
