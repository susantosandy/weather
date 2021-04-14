//
//  SearchWeatherPresenter.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

class SearchWeatherPresenter: SearchWeatherViewToPresenterProtocol {
    
    var view: SearchWeatherPresenterToViewProtocol?
    var interactor: SearchWeatherPresenterToInteractorProtocol?
    var router: SearchWeatherPresenterToRouterProtocol?
    
    var estimatedRowHeight: CGFloat = 500
    var minLengthSearch: Int = 1
    var enumWeatherUnit: EnumWeatherUnits = .metric
    var cityName: String?
    var search: Search?
    
    func getSearchWeather(withCityName cityName: String) {
        view?.showLoading()
        let weatherRequest = WeatherRequest()
        weatherRequest.city = cityName
        weatherRequest.unit = enumWeatherUnit
        interactor?.fetchSearchWeather(withWeatherRequest: weatherRequest)
    }
}

extension SearchWeatherPresenter: SearchWeatherInteractorToPresenterProtocol {
    func searchSucceed(withSearch search: Search) {
        view?.hideLoading()
        self.search = search
        view?.showSearchSucceed()
    }
    
    func searchEmpty() {
        view?.hideLoading()
        self.search = nil
        view?.showSearchEmpty()
    }
    
    func searchFailed(withErrorException error: ErrorExceptionAPI) {
        view?.hideLoading()
        view?.showSearchFailed(withErrorException: error)
    }
}
