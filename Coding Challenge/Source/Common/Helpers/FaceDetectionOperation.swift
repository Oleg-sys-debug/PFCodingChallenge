//
//  FaceDetectionOperation.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

class FaceDetectionOperation: Operation {
    enum State: String {
        case isReady
        case isExecuting
        case isFinished
    }

    var state: State = .isReady {
        willSet(newValue) {
            willChangeValue(forKey: state.rawValue)
            willChangeValue(forKey: newValue.rawValue)
        }
        didSet {
            didChangeValue(forKey: oldValue.rawValue)
            didChangeValue(forKey: state.rawValue)
        }
    }
 
    override var isAsynchronous: Bool { true }
    
    override var isExecuting: Bool { state == .isExecuting }
    
    override var isFinished: Bool {
        if isCancelled && state != .isExecuting { return true }
        return state == .isFinished
    }
    
    private let listItem: PersonListItem
    
    init(_ listItem: PersonListItem) {
         self.listItem = listItem
     }

    override func start() {
        guard !isCancelled else { return }

        state = .isExecuting
        listItem.faces = listItem.person.imgPath()?.faceDetector()
        state = .isFinished
    }
}
