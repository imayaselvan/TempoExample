//
//  DetailCoordinator.swift
//  ProductViewer
//
//  Created by Imayaselvan  on 05/04/20.
//  Copyright © 2020 Target. All rights reserved.
//

import Foundation
import Tempo

/*
 Coordinator for the Product Detail Page
 */
class DetailCoordinator: TempoCoordinator {
    
    // MARK: Presenters, view controllers, view state.
    
    var presenters = [TempoPresenterType]() {
        didSet {
            updateUI()
        }
    }
    
    fileprivate var viewState: DetailViewState {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        for presenter in presenters {
            presenter.present(viewState)
        }
    }
    
    let dispatcher = Dispatcher()
    
    lazy var viewController: DetailViewController = {
        return DetailViewController.viewControllerFor(coordinator: self)
    }()
    
    // MARK: Init
    
    required init(with deal : Deal) {
        viewState = DetailViewState(with: deal)
        registerListeners()

    }
    
    fileprivate func registerListeners() {
        dispatcher.addObserver(AddtoCartItemPressed.self) { event in
            self.viewController.displayalert(title: "Add to Cart", message: self.viewState.title )
        }
       
        dispatcher.addObserver(AddtoListItemPressed.self) { event in
            self.viewController.displayalert(title:"Add to List" , message: self.viewState.title)

        }
        
        dispatcher.addObserver(Close.self) { event in
            self.viewController.dismiss(animated: true, completion: nil)
        }

    }

}
