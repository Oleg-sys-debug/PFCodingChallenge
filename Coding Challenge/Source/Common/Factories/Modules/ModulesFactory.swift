//
//  ModulesFactory.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

final class ModulesFactory {}

extension ModulesFactory: FeedFactoryProtocol {
    func makeFeedItemView(_ item: PersonListItem) -> FeedItemViewProtocol {
        let view: FeedItemViewController = FeedItemViewController()
        FeedItemAssembly.assembly(with: view, item: item)
        return view
    }
    
    func makeFeedView() -> FeedViewProtocol {
        let view: FeedViewController = FeedViewController.controllerFromStoryboard(.main)
        FeedAssembly.assembly(with: view)
        return view
    }
}
