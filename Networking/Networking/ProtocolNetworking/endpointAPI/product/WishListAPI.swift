//
//  WishListAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-22.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public enum WishListAPI {
    case getWishList(requestData: Parameters)
    case removeProductFromWishList(requestData: Parameters)
    case addProductToWishList(requestData: Parameters)
}

extension WishListAPI: EndPointType {
    
    var environmentBaseURL : String {
        let authNetworkManager = AuthNetworkManager()
        switch authNetworkManager.environment {
        case .production: return "https://getclothme.com/prod/api"
        case .qa: return "https://getclothme.com/qa/api"
        case .staging: return "https://getclothme.com/staging/api"
        }
    }
    
    public var baseUrl: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured")
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .getWishList(requestData: let requestData):
            <#code#>
        case .removeProductFromWishList(requestData: let requestData):
            <#code#>
        case .addProductToWishList(requestData: let requestData):
            <#code#>
        }
    }
    
    public var httpMethod: HTTPMethod {
        return .post
    }
    
    public var task: HTTPTask {
        switch self {
        case .getWishList(requestData: let requestData):
            <#code#>
        case .removeProductFromWishList(requestData: let requestData):
            <#code#>
        case .addProductToWishList(requestData: let requestData):
            <#code#>
        }
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
    
    
}
