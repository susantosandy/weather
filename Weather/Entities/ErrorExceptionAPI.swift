//
//  ErrorExceptionAPI.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import SwiftyJSON

class ErrorExceptionAPI {
    
    enum ErrorType {
        static let notFound = "404"
        static let internalServerError = "500"
    }
    
    var code: String?
    var codInt: Int?
    var codString: String?
    var message: String?
    
    init(json: JSON? = nil) {
        guard let json = json else {
            return
        }
        code = json["error"].string
        codInt = json["cod"].int
        codString = json["cod"].string
        message = json["message"].string ?? getErrorMessage()
    }
    
    func getErrorMessage() -> String {
        var errorMessage = ""
        
        switch code {
        case ErrorType.notFound:
            errorMessage = "Please check your internet connection to load the page"
        case ErrorType.internalServerError:
            errorMessage = "Sorry, our server is busy right now. We will be back in a little while"
        default:
            errorMessage = "Please Contact Customer Service"
        }
        
        return errorMessage
    }
}

class NoInternetConnectionException: ErrorExceptionAPI {
    
    init() {
        super.init()
        code = "404"
        message = getErrorMessage()
    }
}

class InternalServerErrorException: ErrorExceptionAPI {
    
    init() {
        super.init()
        code = "500"
        message = getErrorMessage()
    }
}
