//
//  MainWeatherViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class MainWeatherViewController: BaseViewController {
    
    var presenter: MainWeatherViewToPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MainWeatherViewController: MainWeatherPresenterToViewProtocol {
    
}
