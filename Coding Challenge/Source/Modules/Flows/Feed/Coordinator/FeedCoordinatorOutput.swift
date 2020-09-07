//
//  FeedCoordinatorOutput.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol FeedCoordinatorOutput: class {
    var finishFlow: CompletionBlock? { get set }
}
