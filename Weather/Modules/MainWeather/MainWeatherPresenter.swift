//
//  MainWeatherPresenter.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation

class MainWeatherPresenter: MainWeatherViewToPresenterProtocol {
    
    var view: MainWeatherPresenterToViewProtocol?
    var interactor: MainWeatherPresenterToInteractorProtocol?
    var router: MainWeatherPresenterToRouterProtocol?
    
}

extension MainWeatherPresenter: MainWeatherInteractorToPresenterProtocol {
    
}
