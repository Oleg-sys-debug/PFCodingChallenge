//
//  FeedCoordinator.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import IGListKit

protocol FeedCoordinatorProtocol: class {
    func show(item: ListDiffable) 
}

class FeedCoordinator: BaseCoordinator, FeedCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    private let factory: FeedFactoryProtocol
    private let router: Routable
    
    init(with factory: FeedFactoryProtocol, router: Routable) {
        self.factory = factory
        self.router = router
    }
}

extension FeedCoordinator: Coordinatable {
    func start() {
        performFeed()
    }
    
    func performFeed() {
        let view = factory.makeFeedView()
        view.delegate = self
        router.setRootModule(view, hideBar: false)
    }
    
    func showFeedItem(item: PersonListItem) {
        let view = factory.makeFeedItemView(item)
        router.push(view)
    }
}

extension FeedCoordinator: FeedCoordinatorProtocol {
    func show(item: ListDiffable) {
        guard let item = item as? PersonListItem else {
            return
        }
        showFeedItem(item: item)
    }
}
