//
//  MainWeatherRouter.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

class MainWeatherRouter: MainWeatherPresenterToRouterProtocol {
    
    weak var view: MainWeatherViewController?
    
    static func createModule() -> MainWeatherViewController {
        let viewController = UIStoryboard.init(name: "MainWeather", bundle: nil).instantiateViewController(withIdentifier: "MainWeatherViewController") as! MainWeatherViewController
        let presenter: MainWeatherViewToPresenterProtocol & MainWeatherInteractorToPresenterProtocol = MainWeatherPresenter()
        let router = MainWeatherRouter()
        let interactor = MainWeatherInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    func showSearchWeather() {
        let search = SearchWeatherRouter.createModule()
        let searchNav: UINavigationController = UINavigationController(rootViewController: search)
        search.delegate = view
        view?.present(searchNav, animated: true, completion: nil)
    }
    
    func showOptionMenu() {
        let optionMenu = OptionMenuRouter.createModule()
        optionMenu.delegate = view
        optionMenu.view.backgroundColor = .white
        optionMenu.view.layer.setShadows()
        optionMenu.preferredContentSize = CGSize(width: 80, height: 50)
        optionMenu.modalPresentationStyle = .popover
        let popover = optionMenu.popoverPresentationController
        popover?.delegate = view
        popover?.backgroundColor = .white
        popover?.permittedArrowDirections = .up
        popover?.sourceView = view?.buttonOptionMenu
        popover?.sourceRect = CGRect(x: 12, y: 30, width: 0, height: 0)
        view?.present(optionMenu, animated: true, completion: nil)
    }
    
    func showAboutWeather() {
        let about = AboutWeatherRouter.createModule()
        view?.navigationController?.pushViewController(about, animated: true)
    }
}
