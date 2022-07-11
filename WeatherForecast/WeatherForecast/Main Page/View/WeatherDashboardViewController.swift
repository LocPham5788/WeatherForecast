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
    
    private var httpStatusCode: HTTPResponseStatusCode = .ok
    private lazy var viewModel = WeatherDashboardViewModel(delegate: self)
    
    private var weatherItems: [WeatherItem] = [] {
        didSet {
            // If weather lit has data or search city isn't found
            // => Show tableview, else hide it
            if weatherItems.count > 0 || (weatherItems.count == 0 && httpStatusCode == .notFound) {
                tableView.isHidden = false
                tableView.reloadData()
            } else {
                tableView.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUIs()
    }

    // MARK: - Setup UIs
    
    private func setupUIs() {
        // Setup keyboard & TableView
        searchBar.becomeFirstResponder()
        tableView.isHidden = true
    }
}

// MARK: - Private
private extension WeatherDashboardViewController {
    
    @discardableResult
    func validateSearchConditions(isShowError: Bool = false) -> Bool {
        let searchBarText = searchBar.text?.trimmingCharacters(in: .whitespaces)
        guard let cityName = searchBarText, !cityName.isEmpty, cityName.count >= 3 else {
            if isShowError {
                showErrorMessage(.invalidCity)
            } else {
                httpStatusCode = .ok
                weatherItems = []
            }
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
        if validateSearchConditions(isShowError: true) {
            view.endEditing(true)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        searchBar.text = ""
        httpStatusCode = .ok
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        executeFetchWeatherList()
    }
}

// MARK: - WeatherListViewDelegate
extension WeatherDashboardViewController: WeatherDashboardViewDelegate {
    func didFetchWeatherItemsFailed(_ statusCode: HTTPResponseStatusCode?, errorMessage: String?) {
        guard let statusCode = statusCode else {
            return
        }
        switch statusCode {
        case .noInternet:
            showErrorMessage(.fetchingNoInternet)
        case .badRequest:
            showErrorMessage(.fetchingBadRequest)
        case .unknown:
            showErrorMessage(.fetchingUnknown)
        default:
            break
        }
        httpStatusCode = statusCode
        weatherItems = []
    }
    
    func didFetchWeatherItemsSucceed(_ items: [WeatherItem]) {
        httpStatusCode = .ok
        weatherItems = items
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension WeatherDashboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if weatherItems.isEmpty && (httpStatusCode == .notFound || !validateSearchConditions()) {
            return 1
        }
        return weatherItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDashboardTableViewCell.identifier, for: indexPath) as? WeatherDashboardTableViewCell {
            var contentText: String?
            if httpStatusCode == .notFound {
                contentText = "No search city found"
            } else {
                if weatherItems.count > indexPath.row {
                    contentText = weatherItems[indexPath.row].weatherItemDescription()
                    //weatherImage = weatherItems[indexPath.row].main
                }
                
            }
            if let contentText = contentText {
                let attributedString = NSMutableAttributedString(string: contentText)
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 8.0
                attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle,
                                              range: NSMakeRange(0, attributedString.length))
                cell.weatherInfoLabel.attributedText = attributedString
                cell.accessibilityLabel = contentText
            }
            return cell
        }
        return WeatherDashboardTableViewCell()
    }
}
