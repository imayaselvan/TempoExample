//
//  ProductListComponent.swift
//  ProductViewer
//
//  Copyright © 2016 Target. All rights reserved.
//

import Tempo
import SDWebImage
struct ProductListComponent: Component {
    
    var dispatcher: Dispatcher?

    func prepareView(_ view: ProductListView, item: ListItemViewState) {
        // Called on first view or ProductListView
    }
    
    func configureView(_ view: ProductListView, item: ListItemViewState) {
        view.titleLabel.text = item.title
        view.priceLabel.text = item.price
        view.productImage.sd_setImage(with: URL.init(string: item.imageURL), placeholderImage: UIImage.init(named: "offer"), completed: nil)
    }
    
    func selectView(_ view: UIView, viewState: TempoViewStateItem, index: Int) {
        dispatcher?.triggerEvent(ListItemPressed(index: index))

    }

}

extension ProductListComponent: HarmonyLayoutComponent {
    func heightForLayout(_ layout: HarmonyLayout, item: TempoViewStateItem, width: CGFloat) -> CGFloat {
        return 100.0
    }
}
