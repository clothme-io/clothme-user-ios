//
//  UserNetworkManager.swift
//  Networking
//
//  Created by MACPRO on 2020-06-07.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

struct UserNetworkManager {
    static let environment: NetworkEnvironment = .production
    private static let userRouter = Router<AuthAPI>()
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String, NetworkResponse> {
        switch response.statusCode {
        case 200...299: return .success("String")
        case 401...500: return .failure(NetworkResponse.authenticationError)
        case 501...599: return .failure(NetworkResponse.badRequest)
        case 600: return .failure(NetworkResponse.outdated)
        default: return .failure(NetworkResponse.failed)
        }
    }
}
