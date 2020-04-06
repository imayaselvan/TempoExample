//
//  DealsResponse.swift
//  ProductViewer
//
//  Created by Imayaselvan  on 01/04/20.
//  Copyright © 2020 Target. All rights reserved.
//

import Foundation

struct DealsResponse: Codable {
    var deals: [Deal]
  
    enum CodingKeys: String, CodingKey {
        case deals = "data"
    }

}

// MARK: Deals

struct Deal: Codable {
    let description: String
    let image: String
    let price: String
    let salePrice: String? /* Getting Null Value */
    let title: String
    let _id: String
    
    init() {
        description = ""
        image = ""
        price = ""
        salePrice = ""
        title = ""
        _id = ""
    }

}


/// TODO :  Use Deals Collection 

class DealsCollection: NSObject {
    var models = [Deal]()
    fileprivate var pagingId: String?
    fileprivate(set) var pageIndex: Int!
    fileprivate var pageCount: Int?

    override init() {
    }

    // MARK: load more

    func loadMore() {

    }
}

// MARK: DealsCollection helpers

extension DealsCollection {
    var count: Int {
        return models.count
    }

    func at(_ index: Int) -> Deal {
        return models[index]
    }

    func findIndexById(_ id: String) -> Int? {
        return models.firstIndex { $0._id == id }
    }

    func reset(_ models: [Deal]) {
        self.models.removeAll(keepingCapacity: false)
        self.models.append(contentsOf: models)
    }

    func append(_ models: [Deal]) {
        self.models.append(contentsOf: models)
    }
}

