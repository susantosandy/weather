//
//  SearchWeatherContract.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

protocol SearchWeatherPresenterToViewProtocol: class {
    
}

protocol SearchWeatherPresenterToInteractorProtocol: class {
    var presenter: SearchWeatherInteractorToPresenterProtocol? { get set }
    
}

protocol SearchWeatherInteractorToPresenterProtocol: class {
    
}

protocol SearchWeatherViewToPresenterProtocol: class {
    var view: SearchWeatherPresenterToViewProtocol? { get set }
    var interactor: SearchWeatherPresenterToInteractorProtocol? { get set }
    var router: SearchWeatherPresenterToRouterProtocol? { get set }
    
    var estimatedRowHeight: CGFloat { get }
}

protocol SearchWeatherPresenterToRouterProtocol: class {
    static func createModule() -> SearchWeatherViewController
}
