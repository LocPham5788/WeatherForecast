//
//  HTTPResponseStatusCode.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation

enum HTTPResponseStatusCode: Int {
    case noInternet                     = -1
    case unknown                        = 0
    case ok                             = 200
    case badRequest                     = 400
    case notFound                       = 404
}
