//
//  WeatherDashboardViewController.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import UIKit

final class WeatherDashboardViewController: UIViewController {

    // MARK: - Private IBOutlet
    
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Private properties
    
    private lazy var viewModel = WeatherDashboardViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create request
        let request = WeatherQueryRequest(cityName: "saigon")
        viewModel.fetchWeatherWithRequest(request)
    }


}

// MARK: - WeatherListViewDelegate
extension WeatherDashboardViewController: WeatherDashboardViewDelegate {
    func didFetchWeatherListSucceed() {
        
    }
    
    func didFetchWeatherListFailed() {
        
    }
}
