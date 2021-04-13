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
}

extension MainWeatherPresenter: MainWeatherInteractorToPresenterProtocol {
    
}
