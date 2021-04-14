//
//  BaseViewController.swift
//  Weather
//
//  Created by Sandy Susanto on 13/04/21.
//

import UIKit

class BaseViewController: UIViewController, LoadingViewDelegate {
    
    private var loadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLoadingView()
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if #available(iOS 13.0, *) {
            let presentationStyle = viewControllerToPresent.modalPresentationStyle
            
            switch presentationStyle {
            case .automatic, .pageSheet:
                viewControllerToPresent.modalPresentationStyle = .fullScreen
            default:
                break
            }
        }
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    deinit {
        self.deinitView()
    }

    func setupUI() {
        self.view.backgroundColor = ColorConstants.primaryColor
    }
    
    func setupLoadingView() {
        loadingView = LoadingView.instantiateFromNib()
    }
    
    func doTryAgainView(_ button: UIButton) {
        loadingView?.showLoading()
    }
    
    func showLoadingWithView(withView view: UIView, withInsetX insetX: CGFloat = 0, withInsetY insetY: CGFloat = 0) {
        loadingView?.addLoadingView(withView: view, withInsetX: insetX, withInsetY: insetY)
    }
    
    func stopLoading() {
        loadingView?.removeLoadingView()
    }
    
    func deinitView() {
        loadingView = nil
    }
    
    func showError(withError error: ErrorExceptionAPI, inView targetView: UIView? = nil) {
        addLoadingAsSubViewIfNeed()
        loadingView?.showError(withError: error, withDelegate: self)
        
        if let targetView = targetView {
            loadingView?.frame = targetView.frame
        }
    }
    
    func showEmpty(withTitle title: String, withMessage message: String, inView targetView: UIView? = nil) {
        addLoadingAsSubViewIfNeed()
        loadingView?.showEmpty(title: title, message: message)
        
        if let targetView = targetView {
            loadingView?.frame = targetView.frame
        }
    }
    
    func addLoadingAsSubViewIfNeed() {
        if let loadingView = loadingView {
            if !view.subviews.contains(loadingView) {
                view.addSubview(loadingView)
            }
        }
    }
}
