//
//  MainWeatherViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class MainWeatherViewController: BaseViewController {
    
    @IBOutlet weak var buttonCurrentLocation: UIButton!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var buttonOptionMenu: UIButton!
    
    var presenter: MainWeatherViewToPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func currentLocationPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func searchLocationPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func optionMenuPressed(_ sender: UIButton) {
    }
    
}

extension MainWeatherViewController: MainWeatherPresenterToViewProtocol {
    
}
