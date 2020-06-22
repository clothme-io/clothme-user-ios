//
//  ReviewAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-22.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public enum ReviewAPI {
    case addProductReview(requestData: Parameters)
    case getProductReviewByProductId(requestData: Parameters)
    case editProductReview(requestData: Parameters)
    case removeProductReview(requestData: Parameters)
}

extension ReviewAPI: EndPointType {
    
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
        case .addProductReview(requestData: let requestData):
            <#code#>
        case .getProductReviewByProductId(requestData: let requestData):
            <#code#>
        case .editProductReview(requestData: let requestData):
            <#code#>
        case .removeProductReview(requestData: let requestData):
            <#code#>
        }
    }
    
    public var httpMethod: HTTPMethod {
        return .post
    }
    
    public var task: HTTPTask {
        switch self {
        case .addProductReview(requestData: let requestData):
            <#code#>
        case .getProductReviewByProductId(requestData: let requestData):
            <#code#>
        case .editProductReview(requestData: let requestData):
            <#code#>
        case .removeProductReview(requestData: let requestData):
            <#code#>
        }
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
    
    
}
