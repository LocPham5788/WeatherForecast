//
//  WeatherDashboardViewModel.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import UIKit

protocol WeatherDashboardViewDelegate: AnyObject {
    func didFetchWeatherListSucceed()
    func didFetchWeatherListFailed()
}


class WeatherDashboardViewModel {
    
    // MARK: - Properties
    
    weak var delegate: WeatherDashboardViewDelegate?
    private var apiRequest: WeatherRequest?
    // MARK: - Initilize
    
    init(delegate: WeatherDashboardViewDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Network Operation
    
    func fetchWeatherWithRequest(_ request: WeatherQueryRequest) {
        
        apiRequest = WeatherRequest(baseURl: APIConfigure.baseUrl, path: APIConfigure.apiPath, query: request.query)
        // Execute request in background thread
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.apiRequest?.execute(completion: { (statusCode, error) in
                self.apiRequest = nil
            })
        }
    }
    
}
