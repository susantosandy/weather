//
//  SearchWeatherViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class SearchWeatherViewController: BaseViewController {

    var presenter: SearchWeatherViewToPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SearchWeatherViewController: SearchWeatherPresenterToViewProtocol {
    
}
