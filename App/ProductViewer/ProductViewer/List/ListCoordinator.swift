//
//  ListCoordinator.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import Foundation
import Tempo

/*
 Coordinator for the product list
 */
class ListCoordinator: TempoCoordinator {
    
    // MARK: Presenters, view controllers, view state.
    
    var presenters = [TempoPresenterType]() {
        didSet {
            updateUI()
        }
    }
    
    fileprivate var viewState: ListViewState {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        for presenter in presenters {
            presenter.present(viewState)
        }
    }
    
    var deals = [Deal]() {
        didSet {
            updateState()
        }
    }

    
    let dispatcher = Dispatcher()
    
    lazy var viewController: ListViewController = {
        return ListViewController.viewControllerFor(coordinator: self)
    }()
    
    // MARK: Init
    
    required init() {
        viewState = ListViewState(listItems: [])
        updateState()
        registerListeners()
    }
    
    // MARK: ListCoordinator
    
    fileprivate func registerListeners() {
        dispatcher.addObserver(ListItemPressed.self) { [weak self] e in
            if let deal = self?.deals[e.index] {
                let detailCoordinator = DetailCoordinator(with: deal)
                let nav = UINavigationController.init(rootViewController: detailCoordinator.viewController)
                self?.viewController.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    func updateState() {
        viewState.listItems = deals.map { deal in
            ListItemViewState(title: deal.title, price: deal.price, imageURL: deal.image)
        }
    }
    
//    func loadDeals() {
//        Service.shared.fetchDeals(success: { (dealsResponse) in
//            self.deals = dealsResponse.deals
//
//        }) { (error) in
//            debugPrint(error)
//            self.viewController.displayalert(title: "Failed", message: error.localizedDescription)
//        }
//    }

}
