//
//  WeatherBaseRequest.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation

protocol WeatherBaseRequest {
    typealias ApiRequestCompletionType = (HTTPResponseStatusCode?, Error?) -> Void
    
    func execute(completion: @escaping ApiRequestCompletionType)
    func cancelRequest()
    func isExecuting() -> Bool
}
