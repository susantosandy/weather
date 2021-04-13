//
//  UIColor+RGB.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0x0000FF)) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
