//
//  Operation+Array.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

extension Array where Element: Operation {
    func onFinish(_ block: @escaping () -> Void) {
        let doneOperation = BlockOperation(block: block)
        self.forEach { [unowned doneOperation] in doneOperation.addDependency($0) }
        OperationQueue().addOperation(doneOperation)
    }
}

