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
    case getWishList(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case removeProductFromWishList(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case addProductToWishList(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
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
        case .getWishList(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_wishlist"
        case .removeProductFromWishList(requestData: _, queryString: let userId, header: _):
            return "\(userId)/remove_product_from_wishlist"
        case .addProductToWishList(requestData: _, queryString: let userId, header: _):
            return "\(userId)/add_product_to_wishlist"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .getWishList:
            return .get
        case .removeProductFromWishList:
            return .delete
        case .addProductToWishList:
            return .post
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .getWishList(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .removeProductFromWishList(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .addProductToWishList(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        }
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
    
    
}
