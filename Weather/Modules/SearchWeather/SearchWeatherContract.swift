//
//  SearchWeatherContract.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

protocol SearchWeatherPresenterToViewProtocol: class {
    func showSearchSucceed()
    func showSearchEmpty()
    func showSearchFailed(withErrorException error: ErrorExceptionAPI)
}

protocol SearchWeatherPresenterToInteractorProtocol: class {
    var presenter: SearchWeatherInteractorToPresenterProtocol? { get set }
    
    func fetchSearchWeather(withWeatherRequest weatherRequest: WeatherRequest)
}

protocol SearchWeatherInteractorToPresenterProtocol: class {
    func searchSucceed(withSearch search: Search)
    func searchEmpty()
    func searchFailed(withErrorException error: ErrorExceptionAPI)
}

protocol SearchWeatherViewToPresenterProtocol: class {
    var view: SearchWeatherPresenterToViewProtocol? { get set }
    var interactor: SearchWeatherPresenterToInteractorProtocol? { get set }
    var router: SearchWeatherPresenterToRouterProtocol? { get set }
    
    var estimatedRowHeight: CGFloat { get }
    var minLengthSearch: Int { get }
    var cityName: String? { get set }
    var enumWeatherUnit: EnumWeatherUnits { get set }
    var search: Search? { get set }
    
    func getSearchWeather(withCityName cityName: String)
}

protocol SearchWeatherPresenterToRouterProtocol: class {
    static func createModule() -> SearchWeatherViewController
}
