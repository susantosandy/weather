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
}

extension SearchWeatherPresenter: SearchWeatherInteractorToPresenterProtocol {
    
}
