//
//  WeatherItemCache.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/9/22.
//

import Foundation

class WeatherItemCache {
    
    // MARK: - Singleton
    
    static let shared: WeatherItemCache = WeatherItemCache()
    
    // MARK: - Private properties
    
    // Default value is 10 minute
    private var cacheSafeTimeInSeconds: TimeInterval = 10 * 60
    // Store weather list item base on queryString
    private var storage: [String: [WeatherItem]]
    private var timer: Timer?
    
    // MARK: - Initialize
    
    private init() {
        storage = [:]
        updateCacheTimer()
    }
    
    func updateCacheTimer() {
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(timeInterval: cacheSafeTimeInSeconds,
                                     target: self,
                                     selector: #selector(timerHandler),
                                     userInfo: nil,
                                     repeats: true)
    }
}

// MARK: - Public
extension WeatherItemCache {
    func add(_ item: [WeatherItem], for query: String) {
        guard storage[query] == nil else {
            return
        }
        storage[query] = item
    }
    
    func weatherList(for query: String) -> [WeatherItem]? {
        let result = storage[query]
        return result
    }
    
    func empty() {
        storage.removeAll()
        storage = [:]
    }
}

// MARK: - Private functions
private extension WeatherItemCache {
    @objc func timerHandler() {
        empty()
    }
}
