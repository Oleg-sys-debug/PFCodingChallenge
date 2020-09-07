//
//  FeedPresenter.swift
//  Coding Challenge
//
//  Created Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import IGListKit

protocol FeedPresenterInput: class {
    func onFeedData()
}

protocol FeedPresenterOutput: class {
    var presenter: FeedPresenterInput? { get set }
    var operationManager: FeedOperationManager? { get set }
    func feedDataProceed(_ data: [ListDiffable]) 
    func show(error: Error)
}

final class FeedPresenter {

    weak var output: FeedPresenterOutput?
    var interactor: FeedInteractor?
    
    var listItems: [PersonListItem] = []
    
    func handleFeed(data: [Person]) {
        listItems = data.map{PersonListItem(person: $0, faces: nil)}.sorted(by: {$0.person.name.localizedCaseInsensitiveCompare($1.person.name) == ComparisonResult.orderedAscending})
        output?.feedDataProceed(listItems)
    }

    func handleError(error: Error) {
        output?.show(error: error)
    }
    
    func sort() {
        listItems = listItems.sorted { (leftPerson, rightPerson) -> Bool in
            guard let leftArea = leftPerson.faces?.maxArea(), let rightArea = rightPerson.faces?.maxArea() else {
                return leftPerson.person.name.localizedCaseInsensitiveCompare(rightPerson.person.name) == ComparisonResult.orderedAscending
            }
            return leftArea > rightArea
        }
        DispatchQueue.main.sync {
            self.output?.feedDataProceed(listItems)
        }
    }
}

extension FeedPresenter: FeedPresenterInput {
    func onFeedData() {
        interactor?.feedData()
    }
}
