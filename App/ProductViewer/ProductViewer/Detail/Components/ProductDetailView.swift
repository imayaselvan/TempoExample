//
//  ProductDetailView.swift
//  ProductViewer
//
//  Created by Imayaselvan  on 06/04/20.
//  Copyright © 2020 Target. All rights reserved.
//

import UIKit
import Tempo

protocol ProductDetailViewDelegate: class {
    func addToCart()
    func addToList()
}

final class ProductDetailView: UIView {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descView: UILabel!
    weak var delegate : ProductDetailViewDelegate?

    
    @IBAction func addToCart(_ sender: Any) {
        delegate?.addToCart()
    }
    @IBAction func addToList(_ sender: Any) {
        delegate?.addToList()
    }
}

extension ProductDetailView: NibLoadedType {
    @nonobjc static let nibName = "ProductDetailView"
}
