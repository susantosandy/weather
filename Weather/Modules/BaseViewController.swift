//
//  BaseViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        self.view.backgroundColor = ColorConstants.primaryColor
    }
}
