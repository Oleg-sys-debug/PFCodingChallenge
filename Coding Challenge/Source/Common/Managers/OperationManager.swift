//
//  OperationManager.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 07.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

class OperationManager {
    
    lazy var operationQueue: OperationQueue = {
        let operationQueue = OperationQueue() 
        operationQueue.qualityOfService = .userInteractive
        operationQueue.maxConcurrentOperationCount = 2
        return operationQueue
    }()
    
    public func add(_ operation: Operation) {
  
    }
    
    public func cancel() {
        operationQueue.cancelAllOperations()
    }
}

