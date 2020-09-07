//
//  CoordinatorFactoryProtocol.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func makeFeedCoordinator(router: Routable) -> Coordinatable & FeedCoordinatorOutput
}

