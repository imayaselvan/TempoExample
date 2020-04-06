//
//  ListViewController.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import UIKit
import Tempo

class ListViewController: UIViewController {
    
    class func viewControllerFor(coordinator: TempoCoordinator) -> ListViewController {
        let viewController = ListViewController()
        viewController.coordinator = coordinator as? ListCoordinator
        
        return viewController
    }
    
    fileprivate var coordinator: ListCoordinator!
    fileprivate var deals: [Deal]?

    lazy var collectionView: UICollectionView = {
        let harmonyLayout = HarmonyLayout()
        
        harmonyLayout.collectionViewMargins = HarmonyLayoutMargins(top: .narrow, right: .none, bottom: .narrow, left: .none)
        harmonyLayout.defaultSectionMargins = HarmonyLayoutMargins(top: .narrow, right: .none, bottom: .none, left: .none)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: harmonyLayout)
        collectionView.backgroundColor = .targetFadeAwayGrayColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        
        return collectionView
    }()
    
    var activityView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView.init(style: .gray)
        activity.hidesWhenStopped = true
        return activity
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addAndPinSubview(collectionView)
        collectionView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)

        view.addAndCenterSubview(activityView)
        activityView.startAnimating()
        activityView.center = view.center

        title = "checkout"
        
        renderView()
        
        fetchDeals()
    }
    
    func fetchDeals() {
       
        service.fetchDeals(success: { (dealsResponse)  in
            self.coordinator.deals = dealsResponse.deals
            self.activityView.stopAnimating()
            
        }) { (error) in
             debugPrint(error)
            self.activityView.stopAnimating()
            self.displayalert(title: "Failed", message: error.localizedDescription)
        }
        
    }
    
    func renderView() {

        let components: [ComponentType] = [
            ProductListComponent()
        ]
        
        let componentProvider = ComponentProvider(components: components, dispatcher: coordinator.dispatcher)

        let collectionViewAdapter = CollectionViewAdapter(collectionView: collectionView, componentProvider: componentProvider)
        
        coordinator.presenters = [
            SectionPresenter(adapter: collectionViewAdapter),
        ]

    }
    
}

