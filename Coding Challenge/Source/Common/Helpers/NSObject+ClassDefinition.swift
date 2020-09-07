//
//  NSObject+ClassDefinition.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

extension NSObject {
    static func nameOfClass() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
