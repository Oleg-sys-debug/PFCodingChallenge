//
//  UIAlertController+Helper.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

public extension UIAlertController {
    static func showAlert(title: String?, message: String?, inViewController viewController: UIViewController, actionBlock: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertActionOk = UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
            if let actionBlock = actionBlock {
                actionBlock()
            }
        }
        
        alert.addAction(alertActionOk)
        
        DispatchQueue.main.async(execute: {
            viewController.present(alert, animated: true, completion: nil)
        })
    }
}
