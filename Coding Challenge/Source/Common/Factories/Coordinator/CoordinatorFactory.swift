//
//  CoordinatorFactory.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

final class CoordinatorFactory {
    fileprivate let modulesFactory = ModulesFactory()
}

extension CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeFeedCoordinator(router: Routable) -> Coordinatable & FeedCoordinatorOutput {
        return FeedCoordinator(with: modulesFactory, router: router)
    }
}

