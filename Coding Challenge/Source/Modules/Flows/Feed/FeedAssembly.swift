//
//  FeedAssembly.swift
//  Coding Challenge
//
//  Created Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol FeedAssemblable: FeedViewProtocol, FeedPresenterOutput {}

final class FeedAssembly {
    static func assembly(with output: FeedPresenterOutput) {
        let interactor = FeedInteractor()
        let presenter  = FeedPresenter()
        let operationManager = FeedOperationManager()
        
        operationManager.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output     = output
        output.presenter     = presenter
        output.operationManager = operationManager
    }
}
