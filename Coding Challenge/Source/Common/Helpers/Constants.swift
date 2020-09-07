//
//  Constants.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

typealias CompletionBlock = () -> Void

enum Storyboards: String {
    case main = "Main"
}

enum File: String {
    
    enum FileError: Error {
        case missingLocaleFile
    }
    
    case appleEx = "apple_execs"
    
    func `extension`() -> String {
        switch self {
        case .appleEx:
            return "json"
        }
    }
}
