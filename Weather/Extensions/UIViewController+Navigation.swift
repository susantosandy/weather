//
//  UIViewController+Navigation.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupLeftBarButtonItems(close: Bool = false, back: Bool = false) {
        var items = [UIBarButtonItem]()
        
        if close {
            let button = UIButton(type: .custom)
            button.setImage(#imageLiteral(resourceName: "ic_close").withRenderingMode(.alwaysTemplate), for: .normal)
            button.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 0)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
            button.widthAnchor.constraint(equalToConstant: button.frame.width).isActive = true
            button.tintColor = .white
            
            let barButtonItemMenu = UIBarButtonItem()
            barButtonItemMenu.customView = button
            items.append(barButtonItemMenu)
        }
        
        if back {
            let button = UIButton(type: .custom)
            button.setImage(#imageLiteral(resourceName: "ic_back-1").withRenderingMode(.alwaysTemplate), for: .normal)
            button.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 0)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
            button.widthAnchor.constraint(equalToConstant: button.frame.width).isActive = true
            button.tintColor = .white
            
            let barButtonItemMenu = UIBarButtonItem()
            barButtonItemMenu.customView = button
            items.append(barButtonItemMenu)
        }
        
        navigationItem.leftBarButtonItems = items
    }
    
    @objc func backPressed(_ sender: UIBarButtonItem) {
        if isModal() {
            self.dismiss(animated: true, completion: nil)
        } else {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func isModal() -> Bool {
        if self.navigationController?.viewControllers.count == 1 {
            return true
        }
        return false
    }
    
    func setNavbarColor() {
        self.navigationController?.navigationBar.barTintColor = ColorConstants.primaryColor
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func setNavbarShadow() {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.setShadows()
    }
}
