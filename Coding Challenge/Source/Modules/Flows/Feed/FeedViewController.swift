//
//  FeedViewController.swift
//  Coding Challenge
//
//  Created Oleg Gordiichuk on 06.09.2020.
//  Copyright © 2020 --. All rights reserved.
//

import IGListKit

class FeedViewController: UIViewController, FeedAssemblable {
    var delegate: FeedCoordinatorProtocol?
    
    var operationManager: FeedOperationManager?
    
	var presenter: FeedPresenterInput?
    
    private var data = [ListDiffable]()
    
    private lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 1)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        return adapter
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        setupUI()
        setupLayout()
        presenter?.onFeedData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        operationManager?.cancel()
    }
    
    internal func setupUI() {
        view.addSubview(collectionView)
    }
    
    internal func setupLayout() {
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension FeedViewController: DefaultSectionListProtocol {
    func selected(item: ListDiffable) {
        delegate?.show(item: item)
    }
}

extension FeedViewController {
    func feedDataProceed(_ data: [ListDiffable]) {
        self.data = data
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    func show(error: Error) {
        showAlert(title: "Error", message: error.localizedDescription)
    }
}

extension FeedViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let list = DefaultSectionList()
        list.operationManager = operationManager
        list.delegate = self
        return list
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

