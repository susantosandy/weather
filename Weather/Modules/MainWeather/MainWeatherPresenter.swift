//
//  MainWeatherPresenter.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

class MainWeatherPresenter: MainWeatherViewToPresenterProtocol {
    
    var view: MainWeatherPresenterToViewProtocol?
    var interactor: MainWeatherPresenterToInteractorProtocol?
    var router: MainWeatherPresenterToRouterProtocol?
    
    var estimatedRowHeight: CGFloat = 500
    var spacing: CGFloat = 8
    var collectionCellWidth: CGFloat = 78
    var collectionHeight: CGFloat = 151
    var currentLocationLatitude: Double?
    var currentLocationLongitude: Double?
    var forecastDetailLatitude: Double?
    var forecastDetailLongitude: Double?
    var enumWeatherUnit: EnumWeatherUnits = .metric
    var title = "Location Permission"
    var message = "Go to settings and allow this app to access your location!"
    var weather: Weather?
    var forecast: Forecast?
    var cityId: Int?
    var weatherDetails: [WeatherDetailRow] {
        get{
            var rows: [WeatherDetailRow] = []
            
            // Humidity
            if let humidity = weather?.main?.humidity {
                rows.append(WeatherDetailRow(row: .humidity, icon: "ic_humidity", label: "Humidity", value: "\(humidity)%"))
            }
            
            // Pressure
            if let pressure = weather?.main?.pressure {
                rows.append(WeatherDetailRow(row: .pressure, icon: "ic_pressure", label: "Atmospheric Pressure", value: "\(Int(pressure)) hpa"))
            }
            
            // Wind Speed
            if let wind = weather?.wind?.speed {
                rows.append(WeatherDetailRow(row: .windSpeed, icon: "ic_wind_speed", label: "Wind", value: "\(wind) m/s"))
            }
            
            // Temperature Min
            if let temperatureMin = weather?.main?.temperatureMin {
                rows.append(WeatherDetailRow(row: .temperatureMin, icon: "ic_temp_min", label: "Min Temperature", value: "\(temperatureMin.measurement(withUnitTemperature: enumWeatherUnit))"))
            }
            
            // Temperature Max
            if let temperatureMax = weather?.main?.temperatureMax {
                rows.append(WeatherDetailRow(row: .temperatureMax, icon: "ic_temp_max", label: "Max Temperature", value: "\(temperatureMax.measurement(withUnitTemperature: enumWeatherUnit))"))
            }
            
            // Clouds
            if let clouds = weather?.clouds?.all {
                rows.append(WeatherDetailRow(row: .clouds, icon: "ic_03d", label: "Clouds", value: "\(clouds)%"))
            }
            
            // Sunrise
            if let sunrise = weather?.sys?.sunrise {
                rows.append(WeatherDetailRow(row: .sunrise, icon: "ic_sunrise", label: "Sunrise", value: "\(sunrise.timestampToString(withFormat: "HH:mm"))"))
            }
            
            // Sunset
            if let sunset = weather?.sys?.sunset {
                rows.append(WeatherDetailRow(row: .sunset, icon: "ic_sunset", label: "Sunset", value: "\(sunset.timestampToString(withFormat: "HH:mm"))"))
            }
            
            return rows
        }
    }
    
    func getCurrentWeather(withLatitude latitude: Double, withLongitude longitude: Double) {
        view?.showLoading()
        let weatherRequest = WeatherRequest()
        weatherRequest.latitude = latitude
        weatherRequest.longitude = longitude
        weatherRequest.unit = enumWeatherUnit
        interactor?.fetchCurrentWeather(withWeatherRequest: weatherRequest)
    }
    
    func getCurrentForecast(withLatitude latitude: Double, withLongitude longitude: Double) {
        view?.showLoading()
        let weatherRequest = WeatherRequest()
        weatherRequest.latitude = latitude
        weatherRequest.longitude = longitude
        weatherRequest.unit = enumWeatherUnit
        interactor?.fetchCurrentForecast(withWeatherRequest: weatherRequest)
    }
    
    func getWeatherDetail(withCityId cityId: Int) {
        view?.showLoading()
        let weatherRequest = WeatherRequest()
        weatherRequest.id = cityId
        weatherRequest.unit = enumWeatherUnit
        interactor?.fetchWeatherDetail(withWeatherRequest: weatherRequest)
    }
    
    func getWeatherForecastDetail(withCityId cityId: Int) {
        view?.showLoading()
        let weatherRequest = WeatherRequest()
        weatherRequest.id = cityId
        weatherRequest.unit = enumWeatherUnit
        interactor?.fetchForecastDetail(withWeatherRequest: weatherRequest)
    }
    
    func showSearchWeather() {
        router?.showSearchWeather()
    }
    
    func showOptionMenu() {
        router?.showOptionMenu()
    }
    
    func showAboutWeather() {
        router?.showAboutWeather()
    }
}

extension MainWeatherPresenter: MainWeatherInteractorToPresenterProtocol {
    func currentWeatherSucceed(withWeather weather: Weather) {
        view?.hideLoading()
        self.weather = weather
        view?.showCurrentWeatherSucceed()
    }
    
    func currentWeatherFailed(withErrorException error: ErrorExceptionAPI) {
        view?.hideLoading()
        view?.showCurrentWeatherFailed(withErrorException: error)
    }
    
    func currentForecastSucceed(withForecast forecast: Forecast) {
        view?.hideLoading()
        self.forecast = forecast
        view?.showCurrentForecastSucceed()
    }
    
    func currentForecastFailed(withErrorException error: ErrorExceptionAPI) {
        view?.hideLoading()
        view?.showCurrentForecastFailed(withErrorException: error)
    }
    
    func weatherDetailSucceed(withWeather weather: Weather) {
        view?.hideLoading()
        self.weather = weather
        view?.showWeatherDetailSucceed()
    }
    
    func weatherDetailFailed(withErrorException error: ErrorExceptionAPI) {
        view?.hideLoading()
        view?.showWeatherDetailFailed(withErrorException: error)
    }
    
    func weatherForecastDetailSucceed(withForecast forecast: Forecast) {
        view?.hideLoading()
        self.forecast = forecast
        view?.showForecastDetailSucceed()
    }
    
    func weatherForecastDetailFailed(withErrorException error: ErrorExceptionAPI) {
        view?.hideLoading()
        view?.showForecastDetailFailed(withErrorException: error)
    }
}
