//
//  AboutWeatherPresenter.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation

class AboutWeatherPresenter: AboutWeatherViewToPresenterProtocol {
    var view: AboutWeatherPresenterToViewProtocol?
    var interactor: AboutWeatherPresenterToInteractorProtocol?
    var router: AboutWeatherPresenterToRouterProtocol?
    
    
}

extension AboutWeatherPresenter: AboutWeatherInteractorToPresenterProtocol {
    
}
