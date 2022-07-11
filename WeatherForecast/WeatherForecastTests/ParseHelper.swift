//
//  ParseHelper.swift
//  WeatherForecastTests
//
//  Created by Loc Pham on 7/11/22.
//

import Foundation
@testable import WeatherForecast

class ParseHelper {
    
    static let shared = ParseHelper()
    
    var jsonEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .useDefaultKeys
        return encoder
    }
    
    var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        return decoder
    }
    
    func dataFromJsonResource(fileName: String) -> Data? {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: fileName, ofType: "json")
        return try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
    }
}

extension ParseHelper {
    static func model(from jsonFile: String) -> WeatherResponse {
        let helper = ParseHelper.shared
        guard let data = helper.dataFromJsonResource(fileName: jsonFile) else {
            fatalError("Json file not found!")
        }
        do {
            let decoder = helper.jsonDecoder
            let model = try decoder.decode(WeatherResponse.self, from: data)
            return model
        } catch {
            fatalError("Could not decode data to WeatherItem")
        }
    }
}
