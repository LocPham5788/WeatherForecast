//
//  WeatherBaseRequest.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation

protocol WeatherBaseRequest {
    typealias ApiRequestCompletionType = (ReceivedModel?, HTTPResponseStatusCode?, Error?) -> Void
    associatedtype ReceivedModel: Decodable
    
    func execute(completion: @escaping ApiRequestCompletionType)
    func cancelRequest()
    func isExecuting() -> Bool
}
