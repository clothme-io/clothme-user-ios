//
//  ProductAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-22.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public enum ProductAPI {
    case getProductByProductId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getProductByProductName(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case removeProduct(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getProductByBrand(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension ProductAPI: EndPointType {
    
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
        
        }
    }
    
    public var httpMethod: HTTPMethod {
        return .post
    }
    
    public var task: HTTPTask {
        switch self {
        
        }
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
    
    
}
