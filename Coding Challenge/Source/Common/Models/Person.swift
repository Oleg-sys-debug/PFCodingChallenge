//
//  Person.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import Vision

struct Person: BaseModel {
    let name: String
    let img: String
}

extension Person {
    func imgPath() -> URL? {
        let pathComponents = img.components(separatedBy: ".")
        return Bundle.main.url(forResource: pathComponents.first, withExtension: pathComponents.last)
    }
}
