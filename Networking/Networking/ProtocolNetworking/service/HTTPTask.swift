//
//  HTTPTask.swift
//  Networking
//
//  Created by MACPRO on 2020-05-06.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String : String]

public enum HTTPTask {
    case request
    
    case requestParameters(
        bodyParameters: Parameters?,
        urlParameters: Parameters?
    )
    
    case requestParametersAndHeaders(
        bodyParameters: Parameters?,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?
    )

}
