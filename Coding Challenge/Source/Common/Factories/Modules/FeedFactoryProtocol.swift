//
//  FeedFactoryProtocol.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit

protocol FeedFactoryProtocol {
    func makeFeedView() -> FeedViewProtocol
    func makeFeedItemView(_ item: PersonListItem) -> FeedItemViewProtocol
}
