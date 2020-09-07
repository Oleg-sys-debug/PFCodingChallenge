//
//  FeedOperationManager.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import IGListKit


class FeedOperationManager: OperationManager {
    
    weak var presenter: FeedPresenter?
    
    override func add(_ operation: Operation) {
        operationQueue.addOperation(operation)
        operationQueue.operations.onFinish { [weak self] in
            self?.presenter?.sort()
        }
    }
}

