//
//  WeatherDAO.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class WeatherDAO: BaseDAO {
    
    var weather: Weather?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        weather = Weather(json: json)
    }
}
