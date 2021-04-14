//
//  ApiWeather.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import Alamofire

enum ApiWeather: URLRequestConvertible {
    
    /**
     - returns: WeatherDAO
     */
    case getCurrentWeather(request: WeatherRequest)
    
    var path: String {
        switch self {
        case .getCurrentWeather(_):
            return "weather"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCurrentWeather(_):
            return .get
        }
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .getCurrentWeather(let request):
            return request.buildForParameterAPI()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try WeatherAPI.Endpoint.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.default.encode(urlRequest, with: self.parameter)
    }
}
