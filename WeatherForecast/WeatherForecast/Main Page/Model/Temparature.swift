//
//  Temparature.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation

struct Temperature: Codable {
    let max: Double?
    let min: Double?
    
    private enum CodingKeys: String, CodingKey {
        case max
        case min
    }
}
