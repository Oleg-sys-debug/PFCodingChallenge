//
//  Presentable.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol Presentable {
    var toPresent: UIViewController? { get }
}

extension UIViewController: Presentable {
    var toPresent: UIViewController? {
        return self
    }
    
    func showAlert(title: String, message: String? = nil) {
        UIAlertController.showAlert(title: title, message: message, inViewController: self,actionBlock: nil)
    }
}
