//
//  SearchWeatherPresenter.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation

class SearchWeatherPresenter: SearchWeatherViewToPresenterProtocol {
    
    var view: SearchWeatherPresenterToViewProtocol?
    var interactor: SearchWeatherPresenterToInteractorProtocol?
    var router: SearchWeatherPresenterToRouterProtocol?
}

extension SearchWeatherPresenter: SearchWeatherInteractorToPresenterProtocol {
    
}
