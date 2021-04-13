//
//  AboutWeatherViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class AboutWeatherViewController: BaseViewController {

    var presenter: AboutWeatherViewToPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AboutWeatherViewController: AboutWeatherPresenterToViewProtocol {
    
}
