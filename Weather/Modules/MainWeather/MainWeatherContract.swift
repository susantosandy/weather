//
//  MainWeatherContract.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

protocol MainWeatherPresenterToViewProtocol: class {
    func showCurrentWeatherSucceed()
    func showCurrentWeatherFailed(withErrorException error: ErrorExceptionAPI)
}

protocol MainWeatherPresenterToInteractorProtocol: class {
    var presenter: MainWeatherInteractorToPresenterProtocol? { get set }
    
    func fetchCurrentWeather(withWeatherRequest weatherRequest: WeatherRequest)
}

protocol MainWeatherInteractorToPresenterProtocol: class {
    func currentWeatherSucceed(withWeather weather: Weather)
    func currentWeatherFailed(withErrorException error: ErrorExceptionAPI)
}

protocol MainWeatherViewToPresenterProtocol: class {
    var view: MainWeatherPresenterToViewProtocol? { get set }
    var interactor: MainWeatherPresenterToInteractorProtocol? { get set }
    var router: MainWeatherPresenterToRouterProtocol? { get set }
    
    var estimatedRowHeight: CGFloat { get }
    var spacing: CGFloat { get }
    var collectionCellWidth: CGFloat { get }
    var collectionHeight: CGFloat { get }
    var currentLocationLatitude: Double? { get set }
    var currentLocationLongitude: Double? { get set }
    var enumWeatherUnit: EnumWeatherUnits { get set }
    var title: String { get }
    var message: String { get }
    var weather: Weather? { get set }
    var weatherDetails: [WeatherDetailRow] { get }
    
    func showSearchWeather()
    func getCurrentWeather(withLatitude latitude: Double, withLongitude longitude: Double)
}

protocol MainWeatherPresenterToRouterProtocol: class {
    static func createModule() -> MainWeatherViewController
    
    func showSearchWeather()
}
