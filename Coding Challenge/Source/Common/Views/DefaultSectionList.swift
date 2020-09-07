//
//  DefaultSectionList.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import IGListKit

protocol DefaultSectionListProtocol: class {
    func selected(item: ListDiffable)
}

final class DefaultSectionList: ListSectionController {
    
    private var item: ListDiffable?
    
    weak var delegate: DefaultSectionListProtocol?
    
    var operationManager: FeedOperationManager?
    
    override init() {
        super.init()
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 85)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell: PersonCell = collectionContext?.dequeueReusableCell(of: PersonCell.classForCoder(), for: self, at: index) as? PersonCell, let object = item as? PersonListItem else {
            return UICollectionViewCell()
        }
        //Not the best place.
        if object.faces == nil {
            operationManager?.add(FaceDetectionOperation(object))
        }
        cell.setup(with: object)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        item = object as? ListDiffable
    }
    
    override func didSelectItem(at index: Int) {
        guard let item = self.item else { return }
        delegate?.selected(item: item)
    }
}




