//
//  MainWeatherViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit
import CoreLocation

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
    
    private let locationManager = CLLocationManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEmpty()
        setupCollectionView()
        setupTableView()
        checkLocationServices()
    }
    
    override func doTryAgainView(_ button: UIButton) {
        super.doTryAgainView(button)
        
        if let cityId = presenter.cityId {
            // Weather Detail
            presenter.getWeatherDetail(withCityId: cityId)
            presenter.getWeatherForecastDetail(withCityId: cityId)
        } else if let latitude = presenter.currentLocationLatitude, let longitude = presenter.currentLocationLongitude {
            // Current Weather
            presenter.getCurrentWeather(withLatitude: latitude, withLongitude: longitude)
            presenter.getCurrentForecast(withLatitude: latitude, withLongitude: longitude)
        }
    }

    @IBAction func currentLocationPressed(_ sender: UIButton) {
        let latitude = presenter.currentLocationLatitude
        let longitude = presenter.currentLocationLongitude
        
        presenter.forecastDetailLatitude = latitude
        presenter.forecastDetailLongitude = longitude
        
        if let latitude = latitude, let longitude = longitude {
            presenter.getCurrentWeather(withLatitude: latitude, withLongitude: longitude)
            presenter.getCurrentForecast(withLatitude: latitude, withLongitude: longitude)
        }
    }
    
    @IBAction func searchLocationPressed(_ sender: UIButton) {
        presenter.showSearchWeather()
    }
    
    @IBAction func optionMenuPressed(_ sender: UIButton) {
        
    }
    
    // Setup Data
    func setupData() {
        if let presenter = presenter, let weather = presenter.weather {
            let units = presenter.enumWeatherUnit
            
            labelCity.text = weather.name
            labelDate.text = weather.dataCalulation?.timestampToString()
            imageWeather.image = UIImage(named: "ic_\(weather.weathers.first?.icon ?? "")")
            labelCurrentTemperature.text = weather.main?.temperature?.measurement(withUnitTemperature: units)
            labelTemperature.text = "\(weather.main?.temperatureMax?.measurement(withUnitTemperature: units) ?? "") /  \(weather.main?.temperatureMin?.measurement(withUnitTemperature: units) ?? "") | Feel like \(weather.main?.temperature?.measurement(withUnitTemperature: units) ?? "")"
            labelWeather.text = weather.weathers.first?.description?.capitalized
        } else {
            setupEmpty()
        }
    }
    
    // Setup Empty
    func setupEmpty() {
        labelCity.text = nil
        labelDate.text = nil
        imageWeather.image = nil
        labelCurrentTemperature.text = nil
        labelTemperature.text = nil
        labelWeather.text = nil
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
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocation()
            checkLocation()
        } else {
            locationDenied()
        }
    }
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func checkLocation() {
        showPermissionView()
        
        switch CLLocationManager.authorizationStatus() {
        case .denied:
            locationDenied()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .restricted, .authorizedAlways:
            stopLoading()
        @unknown default:
            break
        }
    }
    
    func locationDenied() {
        let alertController = UIAlertController(title: presenter.title, message: presenter.message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Settings", style: .default) { (_) in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showPermissionView() {
        showEmpty(withTitle: presenter.title, withMessage: presenter.message, inView: view)
    }
}

extension MainWeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        presenter.currentLocationLatitude = latitude
        presenter.currentLocationLongitude = longitude
        presenter.forecastDetailLatitude = latitude
        presenter.forecastDetailLongitude = longitude
        
        presenter.getCurrentWeather(withLatitude: latitude, withLongitude: longitude)
        presenter.getCurrentForecast(withLatitude: latitude, withLongitude: longitude)
        
        locationManager.stopUpdatingLocation()
    }
}

extension MainWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.forecast?.list.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        
        if let presenter = presenter, let forecast = presenter.forecast, forecast.list.indices.contains(row) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.forecastWeatherCell, for: indexPath) as! ForecastWeatherCell
            
            if let weather = presenter.forecast?.list[row] {
                cell.setupData(withWeather: weather, withUnits: presenter.enumWeatherUnit)
            }
            
            return cell
        }
        
        return UICollectionViewCell()
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
        return presenter.weatherDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if presenter.weatherDetails.indices.contains(row) {
            let weatherDetail = presenter.weatherDetails[row]
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.weatherDetailCell) as! WeatherDetailCell
            cell.setupData(withImage: weatherDetail.icon ?? "", withLabelName: weatherDetail.label ?? "", withlabelValue: weatherDetail.value ?? "")
            
            return cell
        }
        
        return UITableViewCell()
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

extension MainWeatherViewController: SearchWeatherViewDelegate {
    func searchWeatherViewController(withView view: SearchWeatherViewController, withCityId cityId: Int, withLatitude latitude: Double, withLongitude longitude: Double) {
        presenter.cityId = cityId
        presenter.forecastDetailLatitude = latitude
        presenter.forecastDetailLongitude = longitude
        presenter.getWeatherForecastDetail(withCityId: cityId)
        presenter.getWeatherDetail(withCityId: cityId)
    }
}

extension MainWeatherViewController: MainWeatherPresenterToViewProtocol {
    func showLoading() {
        showLoadingWithView(withView: view)
    }
    
    func hideLoading() {
        stopLoading()
    }
    
    func showCurrentWeatherSucceed() {
        setupWeather()
    }
    
    func showCurrentWeatherFailed(withErrorException error: ErrorExceptionAPI) {
        showError(withError: error)
    }
    
    func showCurrentForecastSucceed() {
        setupForecast()
    }
    
    func showCurrentForecastFailed(withErrorException error: ErrorExceptionAPI) {
        showError(withError: error)
    }
    
    func showWeatherDetailSucceed() {
        setupWeather()
    }
    
    func showWeatherDetailFailed(withErrorException error: ErrorExceptionAPI) {
        showError(withError: error)
    }
    
    func showForecastDetailSucceed() {
        setupForecast()
    }
    
    func showForecastDetailFailed(withErrorException error: ErrorExceptionAPI) {
        showError(withError: error)
    }
    
    func setupWeather() {
        setupData()
        tableViewDetails.reloadData()
    }
    
    func setupForecast() {
        collectionViewForecast.isScrollEnabled = true
        collectionViewHeight.constant = presenter.collectionHeight
        collectionViewForecast.reloadData()
    }
}
