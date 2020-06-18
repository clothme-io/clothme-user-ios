//
//  NetworkRouter.swift
//  Networking
//
//  Created by MACPRO on 2020-06-07.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

public protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
