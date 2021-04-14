//
//  OptionMenuRouter.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import UIKit

class OptionMenuRouter: OptionMenuPresenterToRouterProtocol {
    
    weak var view: OptionMenuViewController?
    
    static func createModule() -> OptionMenuViewController {
        let viewController = UIStoryboard.init(name: "OptionMenu", bundle: nil).instantiateViewController(withIdentifier: "OptionMenuViewController") as! OptionMenuViewController
        let presenter: OptionMenuViewToPresenterProtocol & OptionMenuInteractorToPresenterProtocol = OptionMenuPresenter()
        let router = OptionMenuRouter()
        let interactor = OptionMenuInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
