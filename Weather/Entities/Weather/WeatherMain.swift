//
//  WeatherMain.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class WeatherMain {
    
    var humidity: Int?
    var temperatureMin: Double?
    var temperatureMax: Double?
    var temperature: Double?
    var pressure: Double?
    var seaLevel: Double?
    var groundLevel: Double?
    var tempKf: Double?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        humidity = json["humidity"].intValue
        temperatureMin = json["temp_min"].doubleValue
        temperatureMax = json["temp_max"].doubleValue
        temperature = json["temp"].doubleValue
        pressure = json["pressure"].doubleValue
        seaLevel = json["sea_level"].doubleValue
        groundLevel = json["grnd_level"].doubleValue
        tempKf = json["temp_kf"].doubleValue
    }
}
