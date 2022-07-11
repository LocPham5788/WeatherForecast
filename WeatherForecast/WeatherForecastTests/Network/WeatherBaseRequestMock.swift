//
//  WeatherBaseRequestMock.swift
//  WeatherForecastTests
//
//  Created by Loc Pham on 7/11/22.
//

@testable import WeatherForecast

class WeatherBaseRequestMock: WeatherBaseRequest {
    
    var isMockingRequestExecuting: Bool = false
    var isMockingRequestSucceeded: Bool = true
    
    private var weatherListSucceededResponse: WeatherResponse = ParseHelper.model(from: "weatherItemResponseSuccess")
    private var weatherListFailedResponse: WeatherResponse = ParseHelper.model(from: "weatherItemResponseFailed")
    
    typealias ReceivedModel = WeatherResponse
    
    func execute(completion: @escaping ApiRequestCompletionType) {
        if isMockingRequestExecuting {
            if isMockingRequestSucceeded {
                completion(weatherListSucceededResponse, .ok, nil)
            } else {
                completion(weatherListFailedResponse, .notFound, nil)
            }
        } else {
            completion(nil, nil, nil)
        }
    }
    
    func cancelRequest() {
        isMockingRequestExecuting = false
    }
    
    func isExecuting() -> Bool {
        return isMockingRequestExecuting
    }
}

