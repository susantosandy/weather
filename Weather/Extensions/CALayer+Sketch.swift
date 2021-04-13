//
//  CALayer+Sketch.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

extension CALayer {
    
    func setRadius(withPoints points: CGFloat = 4) {
        self.cornerRadius = points
    }
    
    func setBorders(withColor color: UIColor? = .white, withThickness thickness: CGFloat? = 1) {
        if let color = color {
            self.borderColor = color.cgColor
        }
        if let thickness = thickness {
            self.borderWidth = thickness
        }
    }
    
    func setShadows(
        withColor color: UIColor = .black
        , withOpacity opacity: Float = 0.5
        , withPositionX positionX: CGFloat = 1
        , withPositionY positionY: CGFloat = 1
        , withBlur blur: CGFloat = 2
        , withSpread spread: CGFloat = 0) {
        
        self.shadowColor = color.cgColor
        self.shadowOpacity = opacity
        self.shadowOffset = CGSize(width: positionX, height: positionY)
        self.shadowRadius = blur
        
        if spread == 0 {
            self.shadowPath = nil
        } else {
            let rect = bounds.insetBy(dx: spread, dy: spread)
            self.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
