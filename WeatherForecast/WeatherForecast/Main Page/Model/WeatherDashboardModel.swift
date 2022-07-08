//
//  WeatherDashboardModel.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation

struct WeatherDashboardModel: Codable {
    
    let date: Double?
    let pressure: Int?
    let humidity: Int?
    let temperature: Temperature?
    let weather: [Weather]?
    
    private enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperature = "temp"
        case pressure
        case humidity
        case weather
    }
}
