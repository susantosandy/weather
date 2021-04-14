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
        let viewController = MainWeatherRouter.createModule()
        viewController.loadViewIfNeeded()
        return viewController
    }
    
    // Test IBOutlet
    
    func testHas_storyBoardMainWeather() {
        XCTAssertNotNil(storyboard)
    }
    
    func testHas_viewControllerMainWeather() {
        XCTAssertNotNil(viewController)
    }
    
    func testHas_buttonCurrentLocation() {
        XCTAssertNotNil(viewController?.buttonCurrentLocation)
    }
    
    func testHas_buttonSearch() {
        XCTAssertNotNil(viewController?.buttonSearch)
    }
    
    func testHas_buttonOptionMenu() {
        XCTAssertNotNil(viewController?.buttonOptionMenu)
    }
    
    func testHas_labelCity() {
        XCTAssertNotNil(viewController?.labelCity)
    }
    
    func testHas_labelDate() {
        XCTAssertNotNil(viewController?.labelDate)
    }
    
    func testHas_imageWeather() {
        XCTAssertNotNil(viewController?.imageWeather)
    }
    
    func testHas_labelCurrentTemperature() {
        XCTAssertNotNil(viewController?.labelCurrentTemperature)
    }
    
    func testHas_labelTemperature() {
        XCTAssertNotNil(viewController?.labelTemperature)
    }
    
    func testHas_labelWeather() {
        XCTAssertNotNil(viewController?.labelWeather)
    }
    
    func testHas_collectionViewForecast() {
        XCTAssertNotNil(viewController?.collectionViewForecast)
    }
    
    func testHas_collectionViewHeight() {
        XCTAssertNotNil(viewController?.collectionViewHeight)
    }
    
    func testHas_tableViewDetails() {
        XCTAssertNotNil(viewController?.tableViewDetails)
    }
    
    func testHas_tableViewDetailsHeight() {
        XCTAssertNotNil(viewController?.tableViewDetailsHeight)
    }
    
    // Test IBAction
    
    func testHasAction_currentLocationPressed() {
        let control: UIControl? = viewController?.buttonCurrentLocation
        XCTAssertTrue(control?.actions(forTarget: viewController, forControlEvent: .touchUpInside)?.contains("currentLocationPressed:") == true)
    }
    
    func testHasAction_searchLocationPressed() {
        let control: UIControl? = viewController?.buttonSearch
        XCTAssertTrue(control?.actions(forTarget: viewController, forControlEvent: .touchUpInside)?.contains("searchLocationPressed:") == true)
    }
    
    func testHasAction_optionMenuPressed() {
        let control: UIControl? = viewController?.buttonOptionMenu
        XCTAssertTrue(control?.actions(forTarget: viewController, forControlEvent: .touchUpInside)?.contains("optionMenuPressed:") == true)
    }
}
