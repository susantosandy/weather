//
//  Double+Measurement.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation

extension Double {
    
    func measurement(withUnitTemperature unitTemperature: EnumWeatherUnits) -> String {
        var units: UnitTemperature = .celsius
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.numberFormatter.maximumFractionDigits = 0
        
        switch unitTemperature {
        case .standard:
            units = .kelvin
            measurementFormatter.unitStyle = .medium
            measurementFormatter.unitOptions = .providedUnit
        case .metric:
            units = .celsius
            measurementFormatter.unitStyle = .medium
            measurementFormatter.unitOptions = .providedUnit
        case .imperial:
            units = .fahrenheit
            measurementFormatter.unitStyle = .medium
        }
        
        let measurement = Measurement(value: self, unit: units)
        
        return measurementFormatter.string(from: measurement)
    }
}
