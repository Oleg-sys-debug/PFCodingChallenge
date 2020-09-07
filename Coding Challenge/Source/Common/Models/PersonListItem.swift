//
//  PersonListItem.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import IGListKit
import Vision

class PersonListItem {
    let id: String
    var person: Person
    var faces: [VNFaceObservation]?
    
    init(person: Person, faces: [VNFaceObservation]?) {
        self.id = UUID().uuidString
        self.person = person
        self.faces = faces
    }
}

extension PersonListItem: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? PersonListItem else { return false }
        return id == object.id && person.name == object.person.name && faces?.count == object.faces?.count
    }
}


