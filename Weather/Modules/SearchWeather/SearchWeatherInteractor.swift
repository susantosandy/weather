//
//  SearchWeatherInteractor.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation

class SearchWeatherInteractor: SearchWeatherPresenterToInteractorProtocol {
    
    var presenter: SearchWeatherInteractorToPresenterProtocol?
    
    func fetchSearchWeather(withWeatherRequest weatherRequest: WeatherRequest) {
        WeatherAPI.instance.request(withRequest: ApiWeather.getSearchWeather(request: weatherRequest), success: { (json) in
            let searchDAO = SearchDAO(json: json)
            
            if let search = searchDAO.search {
                if search.weatherIsEmpty() {
                    self.presenter?.searchEmpty()
                } else {
                    self.presenter?.searchSucceed(withSearch: search)
                }
            } else {
                self.presenter?.searchFailed(withErrorException: InternalServerErrorException())
            }
        }) { (error) in
            self.presenter?.searchFailed(withErrorException: error)
        }
    }
}
