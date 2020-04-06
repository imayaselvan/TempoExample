//
//  EndPoint.swift
//  ProductViewer
//
//  Created by Imayaselvan  on 01/04/20.
//  Copyright © 2020 Target. All rights reserved.
//

import Foundation

let environment: Environment = .dev

enum Environment {
    case dev
    
    var baseURL: String {
        switch self {
            case .dev: return "https://target-deals.herokuapp.com/api/"
        }
    }
}

enum Endpoint {
    case deals
    
    var url: URL {
        return URL(string: environment.baseURL + "deals")!
    }
}

extension Service {
 
    func fetchDeals(success: @escaping (DealsResponse) -> Void, failure: @escaping Service.ErrorCallback) {
        
        let url = Endpoint.deals.url
        let req = URLRequest(url: url)
        self.fetch(request: req, success: success, failure: failure)
    }
}
