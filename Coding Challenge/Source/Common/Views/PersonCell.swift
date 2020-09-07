//
//  PersonCell.swift
//  Coding Challenge
//
//  Created by Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import IGListKit

final class PersonCell: UICollectionViewCell {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var title: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textAlignment = .left
        return lable
    }()
    
    private lazy var shadowLine: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = UIColor.gray
         return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupLayout()
    }
    
    public func setup(with object: PersonListItem) {
        title.text = object.person.name
        image.image = UIImage(contentsOfFile: object.person.imgPath()!.path)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(shadowLine)
    }
    
    private func setupLayout() {
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
        title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 5).isActive = true
        title.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    
        shadowLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        shadowLine.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        shadowLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        shadowLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
