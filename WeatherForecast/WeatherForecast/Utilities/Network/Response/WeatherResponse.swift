//
//  WeatherResponse.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation

struct WeatherResponse: Codable {
    
    // MARK: - Properties
    
    let statusCode: Int?
    let message: String?
    let items: [WeatherDashboardModel]?
    
    private enum CodingKeys: String, CodingKey {
        case statusCode = "cod"
        case message
        case items = "list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Convert status code from string to int
        statusCode = try Int(container.decode(String.self, forKey: .statusCode)) ?? 0
        // Sometime items is empty when got error
        do {
            items = try container.decode([WeatherDashboardModel].self, forKey: .items)
        } catch DecodingError.keyNotFound {
            items = nil
        }
        // Sometime message is Int or String type, sure make app not crash
        do {
            message = try String(container.decode(Double.self, forKey: .message))
        } catch DecodingError.typeMismatch {
            message = try container.decode(String.self, forKey: .message)
        }
    }
}
