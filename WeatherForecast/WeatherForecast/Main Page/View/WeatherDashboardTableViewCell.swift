//
//  WeatherDashboardTableViewCell.swift
//  WeatherForecast
//
//  Created by Loc Pham on 7/8/22.
//

import Foundation
import UIKit

class WeatherDashboardTableViewCell: UITableViewCell {
    
    // MARK: - Defined
    
    static let identifier = "WeatherDashboardTableViewCell"
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var weatherInfoLabel: UILabel!
    @IBOutlet weak var weatherIconImageview: UIImageView!
}
