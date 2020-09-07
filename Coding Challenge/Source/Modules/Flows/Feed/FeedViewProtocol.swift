//
//  FeedViewProtocol.swift
//  Coding Challenge
//
//  Created Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol FeedViewProtocol: BaseViewController {
    var delegate: FeedCoordinatorProtocol? { get set }
}

