//
//  FeedItemPresenter.swift
//  Coding Challenge
//
//  Created Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol FeedItemPresenterInput: class {
    func onPersonData()
    func onFacesData()
}

protocol FeedItemPresenterOutput: class {
    var presenter: FeedItemPresenterInput? { get set }
    func boxes(_ boxes: [CGRect])
    func person( _ person: Person)
    func show(error: Error)
}

final class FeedItemPresenter {

    weak var output: FeedItemPresenterOutput?
    
    var item: PersonListItem?
    
    var interactor: FeedItemInteractor?
}

extension FeedItemPresenter: FeedItemPresenterInput {
    func onFacesData() {
        let items = item?.faces?.compactMap{$0.boundingBox}
        
        guard let boxes = items, !boxes.isEmpty else {
            output?.show(error: AppError.missingFaces)
            return
        }
        
        output?.boxes(boxes)
    }
    
    func onPersonData() {
        guard let person = item?.person else {
            output?.show(error: AppError.missingPerson)
            return
        }
        output?.person(person)
    }
}
