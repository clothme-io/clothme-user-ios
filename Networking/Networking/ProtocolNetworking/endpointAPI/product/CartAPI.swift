//
//  CartAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-22.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public enum CartAPI {
    case saveCart(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case removeProductFromcart(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case addProductToCart(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getCart(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension CartAPI: EndPointType {
    var environmentBaseURL : String {
        let cartNetworkManager = CartNetworkManager()
        switch cartNetworkManager.environment {
        case .production: return "https://getclothme.com/customer/api"
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
        case .saveCart(requestData: _, queryString: let userId, header: _):
            return "\(userId)/save_cart"
        case .removeProductFromcart(requestData: _, queryString: let userId, header: _):
            return "\(userId)/remove_product_from_cart"
        case .addProductToCart(requestData: _, queryString: let userId, header: _):
            return "\(userId)/add_product_to_cart"
        case .getCart(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_cart"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .saveCart:
            return .post
        case .removeProductFromcart:
            return .post
        case .addProductToCart:
            return .post
        case .getCart:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .saveCart(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .removeProductFromcart(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .addProductToCart(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getCart(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        }
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
    
    
}
