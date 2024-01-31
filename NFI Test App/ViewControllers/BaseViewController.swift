//
//  BaseViewController.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import UIKit

class BaseViewController: UIViewController {
    private var activityLoader = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpActivityLoader()
    }
    
    private func setUpActivityLoader() {
        view.addSubview(activityLoader)
        activityLoader.isHidden = true
        activityLoader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: activityLoader, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: activityLoader, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
    }
    
    func showLoader() {
        activityLoader.isHidden = false
        activityLoader.startAnimating()
        view.bringSubviewToFront(activityLoader)
    }
    
    func hideLoader() {
        activityLoader.isHidden = true
        activityLoader.stopAnimating()
    }
    
    func showErrorAlert(error: APIError, retryHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "error_alert_title".localized(), message: error.getMessage(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "error_alert_retry".localized(), style: .default, handler: retryHandler))
        alert.addAction(UIAlertAction(title: "error_alert_cancel".localized(), style: .cancel))
        present(alert, animated: true)
    }
}
