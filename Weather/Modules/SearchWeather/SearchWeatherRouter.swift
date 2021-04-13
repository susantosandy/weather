//
//  SearchWeatherRouter.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

class SearchWeatherRouter: SearchWeatherPresenterToRouterProtocol {
    
    weak var view: SearchWeatherViewController?
    
    static func createModule() -> SearchWeatherViewController {
        let viewController = UIStoryboard.init(name: "SearchWeather", bundle: nil).instantiateViewController(withIdentifier: "SearchWeatherViewController") as! SearchWeatherViewController
        let presenter: SearchWeatherViewToPresenterProtocol & SearchWeatherInteractorToPresenterProtocol = SearchWeatherPresenter()
        let router = SearchWeatherRouter()
        let interactor = SearchWeatherInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
