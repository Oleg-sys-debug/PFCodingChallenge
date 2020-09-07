//
//  FeedInteractor.swift
//  Coding Challenge
//
//  Created Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

final class FeedInteractor {

    weak var presenter: FeedPresenter?
    
    func feedData() {
        do {
          let people = try Person.load(with: .appleEx)
          presenter?.handleFeed(data: people)
        } catch  {
          presenter?.handleError(error: error)
        }
    }
}
