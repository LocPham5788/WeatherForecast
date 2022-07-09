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
    
    // For making query store caching
    var storeQuery: String {
        var query: String = ""
        if let cityName = cityName, cityName.count != 0 {
            query = cityName
        }
        return query
    }
}
