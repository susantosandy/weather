//
//  OptionMenuContract.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation

protocol OptionMenuPresenterToViewProtocol: class {
    
}

protocol OptionMenuPresenterToInteractorProtocol: class {
    var presenter: OptionMenuInteractorToPresenterProtocol? { get set }
}

protocol OptionMenuInteractorToPresenterProtocol: class {
    
}

protocol OptionMenuViewToPresenterProtocol: class {
    var view: OptionMenuPresenterToViewProtocol? { get set }
    var interactor: OptionMenuPresenterToInteractorProtocol? { get set }
    var router: OptionMenuPresenterToRouterProtocol? { get set }
}

protocol OptionMenuPresenterToRouterProtocol: class {
    static func createModule() -> OptionMenuViewController
}
