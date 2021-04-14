//
//  Forecast.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class Forecast {
    
    var code: String?
    var message: Double?
    var size: Int?
    var list: [Weather] = []
    var city: ForecastCity?
    
    init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        code = json["cod"].stringValue
        message = json["message"].doubleValue
        size = json["cnt"].intValue
        for jsonItem in json["list"].arrayValue {
            if let item = Weather(json: jsonItem) {
                list.append(item)
            }
        }
        city = ForecastCity(json: json["city"])
    }
}
