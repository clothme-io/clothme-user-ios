//
//  MeasurementNetworkManager.swift
//  Networking
//
//  Created by MACPRO on 2020-06-22.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public class MeasurementNetworkManager {
    
    public let environment: NetworkEnvironment
    public let router: Router<MeasurementAPI>
    
    public init() {
        environment = .production
        router = Router<MeasurementAPI>()
    }
    
    public func handleNetworkResponse(_ response: HTTPURLResponse) -> NetworkResult<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
