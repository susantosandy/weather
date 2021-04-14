//
//  WeatherDetailRow.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation

public struct WeatherDetailRow {
    
    var row: EnumWeatherDetail.Row?
    var icon: String?
    var label: String?
    var value: String?
    
    init(row: EnumWeatherDetail.Row, icon: String, label: String, value: String) {
        self.row = row
        self.icon = icon
        self.label = label
        self.value = value
    }
}
