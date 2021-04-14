//
//  ForecastDAO.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class ForecastDAO: BaseDAO {
    
    var forecast: Forecast?
    
    override init(json: JSON?) {
        super.init(json: json)
        guard let json = json else {
            return
        }
        forecast = Forecast(json: json)
    }
}
