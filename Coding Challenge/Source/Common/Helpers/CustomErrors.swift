//
//  CustomErrors.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 07.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

enum AppError: Error {
    case missingFaces
    case missingPerson
}

extension AppError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingFaces:
            return "Missing to detect faces"
        case .missingPerson:
            return "Person data is missing"
        }
    }
}
