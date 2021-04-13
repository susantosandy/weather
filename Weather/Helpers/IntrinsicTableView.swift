//
//  IntrinsicTableView.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import Foundation
import UIKit

protocol IntrinsicTableViewDelegate {
    func intrinsicTableView(withTableView tableView: UITableView, withHeightUpdated newHeight: CGFloat)
}

class IntrinsicTableView: UITableView {
    
    var intrinsicTableViewDelegate: IntrinsicTableViewDelegate?
    
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        intrinsicTableViewDelegate?.intrinsicTableView(withTableView: self, withHeightUpdated: contentSize.height)
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
