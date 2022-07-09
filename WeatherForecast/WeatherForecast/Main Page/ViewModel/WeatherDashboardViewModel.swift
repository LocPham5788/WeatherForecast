//
//  WeatherDashboardViewModel.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import UIKit

protocol WeatherDashboardViewDelegate: AnyObject {
    func didFetchWeatherItemsSucceed(_ items: [WeatherItem])
    func didFetchWeatherItemsFailed(_ statusCode: HTTPResponseStatusCode?, errorMessage: String?)
}


class WeatherDashboardViewModel {
    
    // MARK: - Properties
    
    weak var delegate: WeatherDashboardViewDelegate?
    private var apiRequest: WeatherRequest?
    private var weatherItemCache = WeatherItemCache.shared
    // MARK: - Initilize
    
    init(delegate: WeatherDashboardViewDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Network Operation
    
    func fetchWeatherWithRequest(_ request: WeatherQueryRequest) {
        // Check if cache has current query or not
        if let weatherList = weatherItemCache.weatherList(for: request.storeQuery) {
            print("Existed in cache. Load: \(request.query)")
            delegate?.didFetchWeatherItemsSucceed(weatherList)
        } else {
            apiRequest = WeatherRequest(baseURl: APIConfigure.baseUrl, path: APIConfigure.apiPath, query: request.query)
            // Execute request in background thread
            DispatchQueue.global(qos: .background).async { [weak self] in
                guard let self = self else { return }
                self.apiRequest?.execute(completion: { (response, statusCode, error) in
                    self.apiRequest = nil
                    if let weatherList = response?.items {
                        let weatherListUIModel = weatherList.compactMap { WeatherItem($0) }
                        // Caching if query isn't existed
                        self.weatherItemCache.add(weatherListUIModel, for: request.storeQuery)
                        DispatchQueue.main.async {
                            self.delegate?.didFetchWeatherItemsSucceed(weatherListUIModel)
                        }
                    } else  {
                        DispatchQueue.main.async {
                            self.delegate?.didFetchWeatherItemsFailed(statusCode, errorMessage: error?.localizedDescription)
                        }
                    }
                })
            }
        }
    }
    
}
