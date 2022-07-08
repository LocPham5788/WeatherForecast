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
    
    // MARK: - Initilize
    
    init(delegate: WeatherDashboardViewDelegate) {
        self.delegate = delegate
    }
    
}
