//
//  BaseModel.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol BaseModel: Codable {}

extension BaseModel {
    static func load(with file: File) throws -> [Self] {
        let decoder = JSONDecoder()
        
        guard let url = Bundle.main.url(forResource: file.rawValue, withExtension: file.extension()) else {
            throw File.FileError.missingLocaleFile
        }

        let data = try Data(contentsOf: url)
        let person = try decoder.decode([Self].self, from: data)
        
        return person
    }
}
