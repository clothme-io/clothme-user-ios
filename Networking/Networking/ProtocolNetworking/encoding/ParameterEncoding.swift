//
//  ParameterEncoding.swift
//  Networking
//
//  Created by MACPRO on 2020-05-06.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public typealias Parameters = [String : Any]

protocol ParameterEncoding {
    static func encode (urlRequest: inout URLRequest, with parameters: Parameters) throws
}
