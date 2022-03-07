//
//  Extensions.swift
//
//  Created by Karthick R on 4/10/21.
//

import UIKit

//MARK: Extension to show activity indicator
extension UIActivityIndicatorView {
    func showActivityIndicator(_ show:Bool) {
        if show {
            self.startAnimating()
        }
        else {
            self.stopAnimating()
        }
        self.isHidden = !show
    }
}

//MARK: Extension to show alert controller
extension UIViewController {
    func showAlert(_ strError:String?, _ alertAcionArray: [UIAlertAction]? = nil) {
        DispatchQueue.main.async { [weak self] in
            let objAlertController = UIAlertController(title: Empty_Text, message: strError, preferredStyle: .alert)
            if let tempAlertActionArray = alertAcionArray {
                for tempAlertAction in tempAlertActionArray {
                    objAlertController.addAction(tempAlertAction)
                }
            }
            else {
                let objAlertAction = UIAlertAction(title: Ok_Btn_Text, style: .cancel, handler: nil)
                objAlertController.addAction(objAlertAction)
            }
            self?.present(objAlertController, animated: true, completion: nil)
        }
    }
}
