//
//  ForecastWeatherCell.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class ForecastWeatherCell: UICollectionViewCell {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var labelClock: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        viewMain.backgroundColor = ColorConstants.primaryColor
        viewMain.layer.setShadows()
        viewMain.layer.setRadius()
        viewMain.layer.setBorders()
    }
}
