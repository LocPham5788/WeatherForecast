//
//  Weather.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation

struct Weather: Codable {
    let weatherDescription: String?

    private enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
    }
}
