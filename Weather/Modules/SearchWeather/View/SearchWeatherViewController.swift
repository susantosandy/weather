//
//  SearchWeatherViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

protocol SearchWeatherViewDelegate {
    func searchWeatherViewController(withView view: SearchWeatherViewController, withCityId cityId: Int, withLatitude latitude: Double, withLongitude longitude: Double)
}

class SearchWeatherViewController: BaseViewController {
    
    enum ReuseIdentifier {
        static let searchWeatherCell = "SearchWeatherCell"
    }

    @IBOutlet weak var tableViewSearch: UITableView!
    
    var presenter: SearchWeatherViewToPresenterProtocol!
    var delegate: SearchWeatherViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLeftBarButtonItems(close: true)
        setNavbarColor()
        setNavbarShadow()
        setupNavigation()
        setupTableView()
    }
    
    override func doTryAgainView(_ button: UIButton) {
        super.doTryAgainView(button)
        
        if let cityName = presenter.cityName {
            presenter.getSearchWeather(withCityName: cityName)
        }
    }
    
    func setupNavigation() {
        let searchBar = UISearchBar()
        searchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchBar.barStyle = .default
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "City Name"
        searchBar.delegate = self
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = .white
        }
        
        self.navigationItem.titleView = searchBar
    }
    
    func setupTableView() {
        tableViewSearch.delegate = self
        tableViewSearch.dataSource = self
        tableViewSearch.backgroundColor = ColorConstants.primaryColor
        tableViewSearch.estimatedRowHeight = presenter.estimatedRowHeight
        tableViewSearch.rowHeight = UITableView.automaticDimension
        tableViewSearch.register(UINib(nibName: ReuseIdentifier.searchWeatherCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifier.searchWeatherCell)
    }
}

extension SearchWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.search?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.searchWeatherCell) as! SearchWeatherCell
        
        if let search = presenter.search, search.list.indices.contains(row) {
            let weather = search.list[row]
            cell.setupData(withWeather: weather, withUnits: presenter.enumWeatherUnit)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        if let search = presenter.search, search.list.indices.contains(row), let cityId = search.list[row].id, let coordinate = search.list[row].coordinate, let latitude = coordinate.latitude, let longitude = coordinate.longitude {
            self.dismiss(animated: true) {
                self.delegate?.searchWeatherViewController(withView: self, withCityId: cityId, withLatitude: latitude, withLongitude: longitude)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.estimatedRowHeight
    }
}

extension SearchWeatherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        if let currentText = searchBar.text, currentText.count >= presenter.minLengthSearch {
            presenter.cityName = currentText
            presenter.getSearchWeather(withCityName: currentText)
        }
    }
}

extension SearchWeatherViewController: SearchWeatherPresenterToViewProtocol {
    func showLoading() {
        showLoadingWithView(withView: view)
    }
    
    func hideLoading() {
        stopLoading()
    }
    
    func showSearchSucceed() {
        tableViewSearch.reloadData()
    }
    
    func showSearchEmpty() {
        showEmpty(withTitle: "Empty", withMessage: "Data Not Found")
    }
    
    func showSearchFailed(withErrorException error: ErrorExceptionAPI) {
        showError(withError: error)
    }
}
