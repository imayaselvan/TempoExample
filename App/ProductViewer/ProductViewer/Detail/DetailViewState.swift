//
//  DetailViewState.swift
//  ProductViewer
//
//  Created by Imayaselvan  on 05/04/20.
//  Copyright © 2020 Target. All rights reserved.
//

import Foundation
import Tempo
/// Detail view state
struct DetailViewState: TempoViewState {
    let title: String
    let description: String
    let price: String
    let image: String
    
    init(with deal: Deal) {
        self.title = deal.title
        self.description = deal.description
        self.price = deal.price
        self.image = deal.image
    }
}
