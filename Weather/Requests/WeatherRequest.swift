//
//  WeatherRequest.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation

class WeatherRequest: BaseRequest {
    
    var latitude: Double?
    var longitude: Double?
    var city: String?
    var id: Int?
    var unit: EnumWeatherUnits?
    var size: Int?
    
    override func buildForParameterAPI() -> [String: AnyObject] {
        var parameters = super.buildForParameterAPI()
        parameters["lat"] = latitude as AnyObject?
        parameters["lon"] = longitude as AnyObject?
        parameters["q"] = city as AnyObject?
        parameters["id"] = id as AnyObject?
        parameters["units"] = unit as AnyObject?
        parameters["cnt"] = size as AnyObject?
        parameters["appid"] = WeatherApiKeyConstant.weatherApiKey as AnyObject
        return parameters
    }
}
