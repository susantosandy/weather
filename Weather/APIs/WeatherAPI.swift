//
//  WeatherAPI.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import Alamofire
import AlamofireNetworkActivityLogger
import SwiftyJSON
import Reachability

typealias SuccessResponse = (JSON?) -> Void
typealias ErrorResponse = (ErrorExceptionAPI) -> Void

class WeatherAPI {
    
    static let instance = WeatherAPI()
    
    var alamofireManager: SessionManager = SessionManager.default
    var request: Request?
    
    class Endpoint {
        static let baseUrl = "https://api.openweathermap.org/data/2.5/"
    }
    
    init() {
        #if DEBUG
        NetworkActivityLogger.shared.level = .debug
        #else
        NetworkActivityLogger.shared.level = .off
        #endif
        self.setAFconfig()
    }
    
    func setAFconfig() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // seconds
        configuration.timeoutIntervalForResource = 30
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func request(withRequest request: URLRequestConvertible, success: @escaping SuccessResponse, exception: @escaping ErrorResponse) {
        #if DEBUG
        NetworkActivityLogger.shared.startLogging()
        #endif
        self.request = alamofireManager.request(request).responseJSON { response in
            guard case .failure(_) = response.result else {
                self.handleDataResponse(response: response, success: success, exception: exception)
                self.invalidateAndConfigure()
                return
            }
            self.checkErrorResponse(exception: exception)
            self.invalidateAndConfigure()
        }
    }
    
    func invalidateAndConfigure() {
        #if DEBUG
        NetworkActivityLogger.shared.stopLogging()
        #endif
        alamofireManager.session.finishTasksAndInvalidate()
        setAFconfig()
    }
    
    private func handleDataResponse(response: DataResponse<Any>
        , success: @escaping SuccessResponse
        , exception:@escaping ErrorResponse) {
        
        if let value = response.result.value {
            let jsonValue = JSON(value)
            let baseDAO = BaseDAO(json: jsonValue)
            
            if baseDAO.isError() {
                if let errorException = baseDAO.error {
                    exception(errorException)
                } else {
                    checkErrorResponse(exception: exception)
                }
            } else {
                success(jsonValue)
            }
        } else {
            checkErrorResponse(exception: exception)
        }
    }
    
    private func checkErrorResponse(exceptionError error: ErrorExceptionAPI? = nil, exception: @escaping ErrorResponse) {
        if let reachability = Reachability() {
            switch reachability.connection {
            case .none:
                exception(NoInternetConnectionException())
            default:
                if let error = error {
                    exception(error)
                } else {
                    exception(InternalServerErrorException())
                }
            }
        }
    }
}
