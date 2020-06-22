//
//  LikeAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-22.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public enum LikeAPI {
    case unLikeProduct(requestData: Parameters)
    case likeProduct(requestData: Parameters)
    case getLikeByProductId(requestData: Parameters)
}

extension LikeAPI: EndPointType {
    
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
        case .unLikeProduct(requestData: let requestData):
            <#code#>
        case .likeProduct(requestData: let requestData):
            <#code#>
        case .getLikeByProductId(requestData: let requestData):
            <#code#>
        }
    }
    
    public var httpMethod: HTTPMethod {
        return .post
    }
    
    public var task: HTTPTask {
        switch self {
        case .unLikeProduct(requestData: let requestData):
            <#code#>
        case .likeProduct(requestData: let requestData):
            <#code#>
        case .getLikeByProductId(requestData: let requestData):
            <#code#>
        }
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
    
    
}
