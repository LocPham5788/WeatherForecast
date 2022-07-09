//
//  AppDelegate.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        // Clear cache when app receive memory warning
        WeatherItemCache.shared.empty()
    }
}

