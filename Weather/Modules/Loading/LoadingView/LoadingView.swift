//
//  LoadingView.swift
//  Weather
//
//  Created by Sandy Susanto on 14/04/21.
//

import UIKit

protocol LoadingViewDelegate {
    func doTryAgainView(_ button: UIButton)
}

class LoadingView: UIView {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imageError: UIImageView!
    @IBOutlet weak var labelTitleError: UILabel!
    @IBOutlet weak var labelMessageError: UILabel!
    @IBOutlet weak var buttonTryAgain: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var delegate: LoadingViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    @IBAction func tryAgainPressed(_ sender: UIButton) {
        delegate?.doTryAgainView(sender)
    }
    
    func setupUI() {
        viewMain.backgroundColor = ColorConstants.primaryColor
        buttonTryAgain.layer.setShadows()
        buttonTryAgain.layer.setRadius()
        buttonTryAgain.layer.setBorders()
    }
    
    func showLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        imageError.isHidden = true
        labelTitleError.isHidden = true
        labelMessageError.isHidden = true
        buttonTryAgain.isHidden = true
    }
    
    func addLoadingView(withView view: UIView, withInsetX insetX: CGFloat = 0, withInsetY insetY: CGFloat = 0) {
        showLoading()
        
        self.frame = CGRect(x: insetX, y: insetY, width: view.frame.size.width - insetX, height: view.frame.size.height - insetY)
        view.addSubview(self)
    }
    
    func removeLoadingView() {
        self.removeFromSuperview()
    }
    
    func showError(withError error: ErrorExceptionAPI, withDelegate delegate: LoadingViewDelegate) {
        self.delegate = delegate
        
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        
        imageError.isHidden = true
        imageError.image = #imageLiteral(resourceName: "ic_back")
        
        labelTitleError.isHidden = false
        labelTitleError.text = "There was an Error"
        
        labelMessageError.isHidden = false
        labelMessageError.text = error.message
        
        buttonTryAgain.isHidden = false
        buttonTryAgain.backgroundColor = ColorConstants.primaryColor
    }
    
    func showEmpty(title: String?, message: String?) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        
        imageError.isHidden = true
        imageError.image = #imageLiteral(resourceName: "ic_back")
        
        labelTitleError.isHidden = false
        labelTitleError.text = title
        
        labelMessageError.isHidden = false
        labelMessageError.text = message
        
        buttonTryAgain.isHidden = true
    }
}
