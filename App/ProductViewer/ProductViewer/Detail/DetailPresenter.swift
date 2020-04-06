//
//  DetailPresenter.swift
//  ProductViewer
//
//  Created by Imayaselvan  on 06/04/20.
//  Copyright © 2020 Target. All rights reserved.
//

import Foundation
import Tempo
/// Detail Presenter

class DetailPresenter: TempoPresenterType {
    let detailView: ProductDetailView
    let dispatcher: Dispatcher

    init(view: ProductDetailView, dispatcher:Dispatcher) {
        self.detailView = view
        self.dispatcher = dispatcher
        self.detailView.delegate = self
    }

    func present(_ viewState: TempoViewState) {
        //TODO: Remove Force Unwrap
        let detailViewState = viewState as! DetailViewState
        detailView.priceLabel.text = detailViewState.price
        detailView.productImage.sd_setImage(with: URL.init(string: detailViewState.image), placeholderImage: UIImage.init(named: "offer"), completed: nil)
        detailView.descView.text = detailViewState.description
    }
/*
    func present(viewState: DetailViewState) {
        detailView.priceLabel.text = viewState.price
        detailView.productImage.sd_setImage(with: URL.init(string: viewState.image), placeholderImage: UIImage.init(named: "offer"), completed: nil)
        detailView.descView.text = viewState.description
} */
}

// View Delegate
extension DetailPresenter : ProductDetailViewDelegate {
    
    func addToCart() {
        dispatcher.triggerEvent(AddtoCartItemPressed())
    }
    
    func addToList() {
        dispatcher.triggerEvent(AddtoListItemPressed())
    }

}
