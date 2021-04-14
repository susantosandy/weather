//
//  WeatherVolume.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class WeatherVolume {
    
    var oneHour: Int?
    var threeHour: Int?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        oneHour = json["1h"].intValue
        threeHour = json["3h"].intValue
    }
}
