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
    
    func fetchCurrentForecast(withWeatherRequest weatherRequest: WeatherRequest) {
        WeatherAPI.instance.request(withRequest: ApiWeather.getForecastWeather(request: weatherRequest), success: { (json) in
            let forecastDAO = ForecastDAO(json: json)
            
            if let forecast = forecastDAO.forecast {
                self.presenter?.currentForecastSucceed(withForecast: forecast)
            } else {
                self.presenter?.currentForecastFailed(withErrorException: InternalServerErrorException())
            }
        }) { (error) in
            self.presenter?.currentForecastFailed(withErrorException: error)
        }
    }
    
    func fetchWeatherDetail(withWeatherRequest weatherRequest: WeatherRequest) {
        WeatherAPI.instance.request(withRequest: ApiWeather.getCurrentWeather(request: weatherRequest), success: { (json) in
            let weatherDAO = WeatherDAO(json: json)
            
            if let weather = weatherDAO.weather {
                self.presenter?.weatherDetailSucceed(withWeather: weather)
            } else {
                self.presenter?.weatherDetailFailed(withErrorException: InternalServerErrorException())
            }
        }) { (error) in
            self.presenter?.weatherDetailFailed(withErrorException: error)
        }
    }
    
    func fetchForecastDetail(withWeatherRequest weatherRequest: WeatherRequest) {
        WeatherAPI.instance.request(withRequest: ApiWeather.getForecastWeather(request: weatherRequest), success: { (json) in
            let forecastDAO = ForecastDAO(json: json)
            
            if let forecast = forecastDAO.forecast {
                self.presenter?.weatherForecastDetailSucceed(withForecast: forecast)
            } else {
                self.presenter?.weatherForecastDetailFailed(withErrorException: InternalServerErrorException())
            }
        }) { (error) in
            self.presenter?.weatherForecastDetailFailed(withErrorException: error)
        }
    }
}
