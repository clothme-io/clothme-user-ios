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
    
    // GET FIT PRODUCT
    case getFitProductByCategory(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByCategoryType(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByUserBrand(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByProductYear(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByBrandId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByCountry(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByUserId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByCity(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByLocation(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getFitProductByProductType(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension ProductAPI: EndPointType {
    
    var environmentBaseURL : String {
        let productNetworkManager = ProductNetworkManager()
        switch productNetworkManager.environment {
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
