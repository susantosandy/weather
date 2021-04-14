//
//  WeatherDetailCell.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class WeatherDetailCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    func setupData(withImage image: String, withLabelName name: String, withlabelValue value: String) {
        imageIcon.image = UIImage(named: image)
        labelName.text = name
        labelValue.text = value
    }
}
