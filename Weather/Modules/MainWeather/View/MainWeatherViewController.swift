//
//  MainWeatherViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class MainWeatherViewController: BaseViewController {
    
    enum ReuseIdentifier {
        static let forecastWeatherCell = "ForecastWeatherCell"
        static let weatherDetailCell = "WeatherDetailCell"
    }
    
    @IBOutlet weak var buttonCurrentLocation: UIButton!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var buttonOptionMenu: UIButton!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var labelCurrentTemperature: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelWeather: UILabel!
    @IBOutlet weak var collectionViewForecast: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewDetails: IntrinsicTableView!
    @IBOutlet weak var tableViewDetailsHeight: NSLayoutConstraint!
    
    var presenter: MainWeatherViewToPresenterProtocol!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupTableView()
    }

    @IBAction func currentLocationPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func searchLocationPressed(_ sender: UIButton) {
        presenter.showSearchWeather()
    }
    
    @IBAction func optionMenuPressed(_ sender: UIButton) {
        
    }
    
    // Setup Collection
    func setupCollectionView() {
        collectionViewForecast.delegate = self
        collectionViewForecast.dataSource = self
        collectionViewForecast.register(UINib(nibName: ReuseIdentifier.forecastWeatherCell, bundle: nil), forCellWithReuseIdentifier: ReuseIdentifier.forecastWeatherCell)
        collectionViewHeight.constant = presenter.collectionHeight
    }
    
    // Setup Table
    func setupTableView() {
        tableViewDetails.delegate = self
        tableViewDetails.dataSource = self
        tableViewDetails.estimatedRowHeight = presenter.estimatedRowHeight
        tableViewDetails.rowHeight = UITableView.automaticDimension
        tableViewDetails.intrinsicTableViewDelegate = self
        tableViewDetails.register(UINib(nibName: ReuseIdentifier.weatherDetailCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifier.weatherDetailCell)
    }
}

extension MainWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.forecastWeatherCell, for: indexPath) as! ForecastWeatherCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return presenter.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return presenter.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  presenter.collectionCellWidth, height: presenter.collectionHeight)
    }
}

extension MainWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.weatherDetailCell) as! WeatherDetailCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.estimatedRowHeight
    }
}

extension MainWeatherViewController: IntrinsicTableViewDelegate {
    func intrinsicTableView(withTableView tableView: UITableView, withHeightUpdated newHeight: CGFloat) {
        tableViewDetailsHeight.constant = newHeight
    }
}

extension MainWeatherViewController: MainWeatherPresenterToViewProtocol {
    
}
