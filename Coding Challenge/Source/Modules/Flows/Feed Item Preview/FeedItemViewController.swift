//
//  FeedItemViewController.swift
//  Coding Challenge
//
//  Created Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import UIKit
import Vision

class FeedItemViewController: UIViewController, FeedItemAssemblable {

	var presenter: FeedItemPresenterInput?
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.white
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        presenter?.onPersonData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.onFacesData()
    }
      
    func setupUI() {
        view.addSubview(image)
    }
    
    func setupLayout() {
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
extension FeedItemViewController {
    
    func person(_ person: Person) {
        self.title = person.name
        guard let path = person.imgPath()?.path else {
            return
        }
        image.image = UIImage(contentsOfFile: path)
    }
    
    func boxes(_ boxes: [CGRect]) {
        for box in boxes {
            let layer = CAShapeLayer()
            layer.path = UIBezierPath(rect: image.denormalized(box)).cgPath
            layer.strokeColor = UIColor.yellow.cgColor
            layer.fillColor = nil
            layer.lineWidth = 2
            image.layer.insertSublayer(layer, at: 1)
        }
    }
    
    func show(error: Error) {
        showAlert(title: error.localizedDescription)
    }
}






