//
//  ErrorType.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation

enum ErrorType {
    case invalidCity
    case fetchingNoInternet
    case fetchingBadRequest
    case fetchingUnknown
    
    var errorTitle: String? {
        switch self {
        case .invalidCity:
            return "Invalid City Name"
        case .fetchingBadRequest, .fetchingUnknown, .fetchingNoInternet:
            return "Fetched Weather List Failed"
        }
    }
    
    var errorMessage: String? {
        switch self {
        case .invalidCity:
            return "Search city name must has minimum 3 characters or not be empty. Please try to input again!"
        case .fetchingNoInternet:
            return "No internet connection. Please connect and try again"
        case .fetchingBadRequest:
            return "Number of days must from 1 to 17. Please input correctly and try again"
        case .fetchingUnknown:
            return "Something went wrong. Please try again"
        }
    }
}
