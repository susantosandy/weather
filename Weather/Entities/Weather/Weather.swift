//
//  Weather.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class Weather {
    
    var base: String?
    var wind: WeatherWind?
    var clouds: WeatherClouds?
    var rain: WeatherVolume?
    var snow: WeatherVolume?
    var coordinate: WeatherCoordinate?
    var dataCalulation: Int64?
    var dataCalulationText: String?
    var id: Int?
    var code: Int?
    var weathers: [WeatherItem] = []
    var main: WeatherMain?
    var sys: WeatherSys?
    var name: String?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        base = json["base"].stringValue
        wind = WeatherWind(json: json["wind"])
        clouds = WeatherClouds(json: json["clouds"])
        rain = WeatherVolume(json: json["rain"])
        snow = WeatherVolume(json: json["snow"])
        coordinate = WeatherCoordinate(json: json["coord"])
        dataCalulation = json["dt"].int64Value
        dataCalulationText = json["dt_txt"].stringValue
        id = json["id"].intValue
        code = json["cod"].intValue
        for jsonItem in json["weather"].arrayValue {
            if let item = WeatherItem(json: jsonItem) {
                weathers.append(item)
            }
        }
        main = WeatherMain(json: json["main"])
        sys = WeatherSys(json: json["sys"])
        name = json["name"].stringValue
    }
}
