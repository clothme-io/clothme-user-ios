//
//  EndPointType.swift
//  Networking
//
//  Created by MACPRO on 2020-05-06.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
