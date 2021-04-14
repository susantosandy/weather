//
//  AboutWeatherViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class AboutWeatherViewController: BaseViewController {
    
    @IBOutlet weak var labelVersion: UILabel!
    
    var presenter: AboutWeatherViewToPresenterProtocol!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLeftBarButtonItems(back: true)
        setNavbarColor()
        setNavbarShadow()
        setupNavigation()
        setupData()
    }
    
    func setupNavigation() {
        self.title = "About"
    }
    
    func setupData() {
        labelVersion.text = getVersionBuild()
    }
    
    func getVersionBuild() -> String {
        var versionBuild: String = ""
        if let info = Bundle.main.infoDictionary {
            if let version = info["CFBundleShortVersionString"] as? String {
                versionBuild += "version \(version)"
            }
            if let build = info["CFBundleVersion"] as? String {
                versionBuild += " (\(build))"
            }
            return versionBuild
        }
        return versionBuild
    }
}

extension AboutWeatherViewController: AboutWeatherPresenterToViewProtocol {
    
}
