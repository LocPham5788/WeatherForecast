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
    
    private var currStatusCode: HTTPResponseStatusCode = .ok
    private lazy var viewModel = WeatherDashboardViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

// MARK: - Private
private extension WeatherDashboardViewController {
    
    @discardableResult
    func validateSearchConditions() -> Bool {
        let searchBarText = searchBar.text?.trimmingCharacters(in: .whitespaces)
        guard let cityName = searchBarText, !cityName.isEmpty, cityName.count >= 3 else {
            showErrorMessage(.invalidCity)
            return false
        }
        return true
    }
    
    func showErrorMessage(_ errorType: ErrorType) {
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: errorType.errorTitle,
                                                message: errorType.errorMessage,
                                                preferredStyle: .alert)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func executeFetchWeatherList() {
        // If match validation conditons, continue requesting
        guard validateSearchConditions() else {
            return
        }
        // Create request
        let request = WeatherQueryRequest(cityName: searchBar.text)
        viewModel.fetchWeatherWithRequest(request)
    }
}

// MARK: - UISearchBarDelegate
extension WeatherDashboardViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if validateSearchConditions() {
            view.endEditing(true)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        executeFetchWeatherList()
    }
}

// MARK: - WeatherListViewDelegate
extension WeatherDashboardViewController: WeatherDashboardViewDelegate {
    func didFetchWeatherListSucceed() {
        
    }
    
    func didFetchWeatherListFailed() {
        
    }
}
