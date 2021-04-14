//
//  UIView+Nib.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import UIKit

public extension UIView {
    
    class func instantiateFromNib<T: UIView>(_ viewType: T.Type) -> T {
        let url = URL(string: NSStringFromClass(viewType))
        return Bundle.main.loadNibNamed((url?.pathExtension)!, owner: nil, options: nil)!.first as! T
    }
    
    class func instantiateFromNib() -> Self {
        return instantiateFromNib(self)
    }
}
