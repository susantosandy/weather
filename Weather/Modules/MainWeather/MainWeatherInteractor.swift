//
//  MainWeatherInteractor.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation

class MainWeatherInteractor: MainWeatherPresenterToInteractorProtocol {
    
    var presenter: MainWeatherInteractorToPresenterProtocol?
    
    func fetchCurrentWeather(withWeatherRequest weatherRequest: WeatherRequest) {
        WeatherAPI.instance.request(withRequest: ApiWeather.getCurrentWeather(request: weatherRequest), success: { (json) in
            let weatherDAO = WeatherDAO(json: json)
            
            if let weather = weatherDAO.weather {
                self.presenter?.currentWeatherSucceed(withWeather: weather)
            } else {
                self.presenter?.currentWeatherFailed(withErrorException: InternalServerErrorException())
            }
        }) { (error) in
            self.presenter?.currentWeatherFailed(withErrorException: error)
        }
    }
}
