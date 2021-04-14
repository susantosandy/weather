//
//  OptionMenuPresenter.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation

class OptionMenuPresenter: OptionMenuViewToPresenterProtocol {
    
    var view: OptionMenuPresenterToViewProtocol?
    var interactor: OptionMenuPresenterToInteractorProtocol?
    var router: OptionMenuPresenterToRouterProtocol?
}

extension OptionMenuPresenter: OptionMenuInteractorToPresenterProtocol {
    
}
