//
//  Service.swift
//  ProductViewer
//
//  Created by Imayaselvan  on 01/04/20.
//  Copyright © 2020 Target. All rights reserved.
//

import Foundation

class Service {
    
    typealias ErrorCallback = (Error) -> Void
    
    class var shared: Service {
        return sharedInstance
    }
    
    private static var sharedInstance = Service()
    private var session: URLSession
    private var queue = DispatchQueue.main
    
    init(urlSession: URLSession? = nil) {
        self.session = urlSession ?? URLSession.shared
    }
    
    @discardableResult
    func fetch<T: Decodable>(request: URLRequest,
                             success: @escaping (T) -> Void,
                             failure: ErrorCallback? = nil) -> URLSessionDataTask {
        
        let dataTask = self.session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                self.queue.async { failure?(error!) }
                return
            }
            
            do {
                let parsedData = try JSONDecoder().decode(T.self, from: data ?? Data())
                self.queue.async { success(parsedData) }
            } catch let e {
                self.queue.async { failure?(e) }
            }
        }
        dataTask.resume()
        return dataTask
    }
}
