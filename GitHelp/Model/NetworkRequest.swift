//
//  NetworkRequest.swift
//  GitHelp
//
//  Created by Andrew on 10/24/17.
//  Copyright © 2017 GitHelp. All rights reserved.
//

import Foundation
import UIKit

/* Implemented by Andrew */

protocol NetworkRequest: class {
    associatedtype Model
    func load(withCompletion completion: @escaping (Model?) -> Void)
    func decode(_ data: Data) -> Model?
}

extension NetworkRequest {
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (Model?) -> Void) {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(self?.decode(data))
        })
        task.resume()
    }
}

class ApiRequest<Resource: ApiResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension ApiRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.Model]? {
        return resource.makeModel(data: data)
    }
    
    func load(withCompletion completion: @escaping ([Resource.Model]?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}

