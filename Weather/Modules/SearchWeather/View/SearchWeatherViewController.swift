//
//  SearchWeatherViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class SearchWeatherViewController: BaseViewController {
    
    enum ReuseIdentifier {
        static let searchWeatherCell = "SearchWeatherCell"
    }

    @IBOutlet weak var tableViewSearch: UITableView!
    
    var presenter: SearchWeatherViewToPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLeftBarButtonItems(close: true)
        setNavbarColor()
        setNavbarShadow()
        setupNavigation()
        setupTableView()
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.searchWeatherCell) as! SearchWeatherCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
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
    }
}

extension SearchWeatherViewController: SearchWeatherPresenterToViewProtocol {
    
}
