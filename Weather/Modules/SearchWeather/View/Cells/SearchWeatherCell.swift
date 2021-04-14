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
    
    func setupData(withWeather weather: Weather, withUnits units: EnumWeatherUnits) {
        imageWeather.image = UIImage(named: "ic_\(weather.weathers.first?.icon ?? "")")
        
        let description = "\(weather.name ?? ""), \(weather.weathers.first?.description?.capitalized ?? "")"
        let boldDescription = "\(weather.weathers.first?.description?.capitalized ?? "")"
        let attributeString = NSMutableAttributedString(string: description)
        let rangeBold = attributeString.mutableString.range(of: boldDescription)
        attributeString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: rangeBold)
        attributeString.addAttribute(.foregroundColor, value: ColorConstants.blackColor, range: rangeBold)
        
        labelCity.attributedText = attributeString
        labelTemperature.text = weather.main?.temperature?.measurement(withUnitTemperature: units)
        let temperature = 0.0.measurement(withUnitTemperature: units)
        labelDescription.text = "temperature from \(weather.main?.temperatureMin?.measurement(withUnitTemperature: units) ?? temperature) to \(weather.main?.temperatureMax?.measurement(withUnitTemperature: units) ?? temperature), wind \(weather.wind?.speed ?? 0) m/s. clouds \(weather.clouds?.all ?? 0) %, \(weather.main?.pressure ?? 0) hpa"
    }
}
