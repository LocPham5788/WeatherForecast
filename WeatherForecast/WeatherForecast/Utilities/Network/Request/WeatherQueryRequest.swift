//
//  WeatherQueryRequest.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation

struct WeatherQueryRequest {
    
    // MARK: - Properties
    
    let cityName: String?
    
    // MARK: - Public Properties
    
    // For making query request API
    var query: String {
        var queries: [String] = []
        queries.append("appId=\(APIConfigure.appId)")
        queries.append("q=\(cityName ?? "saigon")")
        queries.append("cnt=7")
        queries.append("units=Celsius")
        return queries.joined(separator: "&")
    }
}
