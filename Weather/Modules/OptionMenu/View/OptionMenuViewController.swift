//
//  OptionMenuViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import UIKit

protocol OptionMenuViewDelegate {
    func optionMenuViewController(withView view: OptionMenuViewController)
}

class OptionMenuViewController: BaseViewController {
    
    @IBOutlet weak var viewMain: UIView!
    
    var presenter: OptionMenuViewToPresenterProtocol!
    var delegate: OptionMenuViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func aboutPressed(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.delegate?.optionMenuViewController(withView: self)
        }
    }
}

extension OptionMenuViewController: OptionMenuPresenterToViewProtocol {
    
}
