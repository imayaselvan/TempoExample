//
//  DetailViewController.swift
//  ProductViewer
//
//  Created by Imayaselvan  on 05/04/20.
//  Copyright © 2020 Target. All rights reserved.
//

import UIKit
import Tempo
class DetailViewController: UIViewController {
    
    class func viewControllerFor(coordinator: DetailCoordinator) -> DetailViewController {
        let viewController = DetailViewController()
        viewController.coordinator = coordinator
        return viewController
    }
   
    fileprivate var coordinator: DetailCoordinator!

    let detailView: ProductDetailView = .fromNib()

    override func viewDidLoad() {
        super.viewDidLoad()
        showCloseBtn()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        view.addAndPinSubview(detailView)

        coordinator.presenters = [
            DetailPresenter.init(view: detailView, dispatcher: coordinator.dispatcher)
        ]
    }
        
}
