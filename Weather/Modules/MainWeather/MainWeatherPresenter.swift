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
    var collectionHeight: CGFloat = 115
    var currentLocationLatitude: Double?
    var currentLocationLongitude: Double?
    var enumWeatherUnit: EnumWeatherUnits = .metric
    var title = "Location Permission"
    var message = "Go to settings and allow this app to access your location!"
    var weather: Weather?
    
    func getCurrentWeather(withLatitude latitude: Double, withLongitude longitude: Double) {
        let weatherRequest = WeatherRequest()
        weatherRequest.latitude = latitude
        weatherRequest.longitude = longitude
        weatherRequest.unit = enumWeatherUnit
        interactor?.fetchCurrentWeather(withWeatherRequest: weatherRequest)
    }
    
    func showSearchWeather() {
        router?.showSearchWeather()
    }
}

extension MainWeatherPresenter: MainWeatherInteractorToPresenterProtocol {
    func currentWeatherSucceed(withWeather weather: Weather) {
        self.weather = weather
        view?.showCurrentWeatherSucceed()
    }
    
    func currentWeatherFailed(withErrorException error: ErrorExceptionAPI) {
        view?.showCurrentWeatherFailed(withErrorException: error)
    }
}
