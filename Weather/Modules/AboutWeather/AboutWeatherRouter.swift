//
//  AboutWeatherRouter.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

class AboutWeatherRouter: AboutWeatherPresenterToRouterProtocol {
    
    weak var view: AboutWeatherViewController?
    
    static func createModule() -> AboutWeatherViewController {
        let viewController = UIStoryboard.init(name: "AboutWeather", bundle: nil).instantiateViewController(withIdentifier: "AboutWeatherViewController") as! AboutWeatherViewController
        let presenter: AboutWeatherViewToPresenterProtocol & AboutWeatherInteractorToPresenterProtocol = AboutWeatherPresenter()
        let router = AboutWeatherRouter()
        let interactor = AboutWeatherInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
