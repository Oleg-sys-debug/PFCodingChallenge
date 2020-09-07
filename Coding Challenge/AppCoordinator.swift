//
//  AppCoordinator.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    fileprivate let factory: CoordinatorFactoryProtocol
    fileprivate let router : Routable
    
    init(router: Routable, factory: CoordinatorFactory) {
        self.router  = router
        self.factory = factory
    }
}

extension AppCoordinator: Coordinatable {
    func start() {
        performFeedFlow()
    }
}

private extension AppCoordinator {
    func performFeedFlow() {
        let coordinator = factory.makeFeedCoordinator(router: router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
}

