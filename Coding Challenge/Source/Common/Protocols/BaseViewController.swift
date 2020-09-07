//
//  BaseViewController.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol BaseViewController: UIViewController {
    func setupUI()
    func setupLayout()
    func show(error: Error)
}

extension BaseViewController {
    func show(error: Error) {}
}
