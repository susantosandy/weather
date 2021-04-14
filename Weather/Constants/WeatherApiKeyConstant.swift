//
//  WeatherApiKeyConstant.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation

struct WeatherApiKeyConstant {
    
    #if PRODUCTION
    static let weatherApiKey = "fe4042eaa47e6c91a2deca9e548d6e77"
    #else
    static let weatherApiKey = "ece628f8b64aa8f32db6016428ca539d"
    #endif
}
