//
//  MainWeatherViewControllerTest.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import XCTest
#if PRODUCTION
@testable import Weather
#else
@testable import WeatherStaging
#endif

class MainWeatherViewControllerTest: XCTestCase {

    var storyboard: UIStoryboard?
    var viewController: MainWeatherViewController?
    
    override func setUp() {
        storyboard = MainWeatherViewControllerTest.createStoryboard()
        viewController = MainWeatherViewControllerTest.createViewController()
    }
    
    override func tearDown() {
        storyboard = nil
        viewController = nil
    }
    
    static func createStoryboard() -> UIStoryboard {
        let storyboardName: String = "MainWeather"
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard
    }
    
    static func createViewController() -> MainWeatherViewController? {
        return MainWeatherRouter.createModule()
    }
    
    func testHas_storyBoardMainWeather() {
        XCTAssertNotNil(storyboard)
    }
    
    func testHas_viewControllerMainWeather() {
        XCTAssertNotNil(viewController)
    }
    
    func testHas_buttonCurrentLocation() {
        XCTAssertNil(viewController?.buttonCurrentLocation)
    }
    
    func testHas_buttonSearch() {
        XCTAssertNil(viewController?.buttonSearch)
    }
    
    func testHas_buttonOptionMenu() {
        XCTAssertNil(viewController?.buttonOptionMenu)
    }
    
    func testHas_labelCity() {
        XCTAssertNil(viewController?.labelCity)
    }
    
    func testHas_labelDate() {
        XCTAssertNil(viewController?.labelDate)
    }
    
    func testHas_imageWeather() {
        XCTAssertNil(viewController?.imageWeather)
    }
    
    func testHas_labelCurrentTemperature() {
        XCTAssertNil(viewController?.labelCurrentTemperature)
    }
    
    func testHas_labelTemperature() {
        XCTAssertNil(viewController?.labelTemperature)
    }
    
    func testHas_labelWeather() {
        XCTAssertNil(viewController?.labelWeather)
    }
    
    func testHas_collectionViewForecast() {
        XCTAssertNil(viewController?.collectionViewForecast)
    }
    
    func testHas_collectionViewHeight() {
        XCTAssertNil(viewController?.collectionViewHeight)
    }
    
    func testHas_tableViewDetails() {
        XCTAssertNil(viewController?.tableViewDetails)
    }
    
    func testHas_tableViewDetailsHeight() {
        XCTAssertNil(viewController?.tableViewDetailsHeight)
    }
}
