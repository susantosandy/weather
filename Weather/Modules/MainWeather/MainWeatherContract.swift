//
//  MainWeatherContract.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

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
    
    var estimatedRowHeight: CGFloat { get }
    var spacing: CGFloat { get }
    var collectionCellWidth: CGFloat { get }
    var collectionHeight: CGFloat { get }
}

protocol MainWeatherPresenterToRouterProtocol: class {
    static func createModule() -> MainWeatherViewController
}
