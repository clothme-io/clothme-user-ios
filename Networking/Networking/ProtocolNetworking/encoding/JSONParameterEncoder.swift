//
//  JSONParameterEncoder.swift
//  Networking
//
//  Created by MACPRO on 2020-06-07.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public struct JSONParameterEncoder: ParameterEncoding {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
    
    
}
