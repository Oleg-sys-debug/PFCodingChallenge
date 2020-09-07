//
//  FeedItemAssembly.swift
//  Coding Challenge
//
//  Created Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol FeedItemAssemblable: FeedItemViewProtocol, FeedItemPresenterOutput {}

final class FeedItemAssembly {
    static func assembly(with output: FeedItemPresenterOutput, item: PersonListItem) {
        let interactor = FeedItemInteractor()
        let presenter  = FeedItemPresenter()
        
        presenter.item = item
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output     = output
        output.presenter     = presenter
    }
}
