//
//  SearchWeatherCell.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import UIKit

class SearchWeatherCell: UITableViewCell {

    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var viewTemperature: UIView!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        viewTemperature.layer.setRadius()
        viewTemperature.layer.setShadows()
    }
}
