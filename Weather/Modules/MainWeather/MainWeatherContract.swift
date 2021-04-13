//
//  MainWeatherContract.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation

protocol MainWeatherPresenterToViewProtocol: class {
    
}

protocol MainWeatherPresenterToInteractorProtocol: class {
    var presenter: MainWeatherInteractorToPresenterProtocol? { get set }
    
}

protocol MainWeatherInteractorToPresenterProtocol: class {
    
}

protocol MainWeatherViewToPresenterProtocol: class {
    var view: MainWeatherPresenterToViewProtocol? { get set }
    var interactor: MainWeatherPresenterToInteractorProtocol? { get set }
    var router: MainWeatherPresenterToRouterProtocol? { get set }
}

protocol MainWeatherPresenterToRouterProtocol: class {
    static func createModule() -> MainWeatherViewController
}
