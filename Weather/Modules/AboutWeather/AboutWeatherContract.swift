//
//  AboutWeatherContract.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation

protocol AboutWeatherPresenterToViewProtocol: class {
    
}

protocol AboutWeatherPresenterToInteractorProtocol: class {
    var presenter: AboutWeatherInteractorToPresenterProtocol? { get set }
    
}

protocol AboutWeatherInteractorToPresenterProtocol: class {
    
}

protocol AboutWeatherViewToPresenterProtocol: class {
    var view: AboutWeatherPresenterToViewProtocol? { get set }
    var interactor: AboutWeatherPresenterToInteractorProtocol? { get set }
    var router: AboutWeatherPresenterToRouterProtocol? { get set }
}

protocol AboutWeatherPresenterToRouterProtocol: class {
    static func createModule() -> AboutWeatherViewController
}
