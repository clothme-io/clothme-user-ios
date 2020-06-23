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
    case unLikeProduct(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case likeProduct(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getLikeByProductId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension LikeAPI: EndPointType {
    var environmentBaseURL : String {
        let likeNetworkManager = LikeNetworkManager()
        switch likeNetworkManager.environment {
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
        case .unLikeProduct(requestData: _, queryString: let userId, header: _):
            return "\(userId)/unlike_product"
        case .likeProduct(requestData: _, queryString: let userId, header: _):
            return "\(userId)/like_product"
        case .getLikeByProductId(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_like_by_product_id"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .unLikeProduct:
            return .patch
        case .likeProduct:
            return .post
        case .getLikeByProductId:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .unLikeProduct(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .likeProduct(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getLikeByProductId(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        }
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
    
    
}
