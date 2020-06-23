//
//  OrderAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-22.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public enum OrderAPI {
    case addProductReview(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getProductReviewByProductId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case editProductReview(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case removeProductReview(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension OrderAPI: EndPointType {
    var environmentBaseURL : String {
        let reviewNetworkManager = ReviewNetworkManager()
        switch reviewNetworkManager.environment {
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
        case .addProductReview(requestData: _, queryString: let userId, header: _):
            return "\(userId)/add_product_review"
        case .getProductReviewByProductId(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_product_review_by_product_id"
        case .editProductReview(requestData: _, queryString: let userId, header: _):
            return "\(userId)/edit_product_review"
        case .removeProductReview(requestData: _, queryString: let userId, header: _):
            return "\(userId)/remove_product_review"
        }
    }
    
    public var httpMethod: HTTPMethod {
        return .post
    }
    
    public var task: HTTPTask {
        switch self {
        case .addProductReview(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getProductReviewByProductId(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .editProductReview(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .removeProductReview(requestData: let data, let queryString, header: let headers):
        return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .addProductReview(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getProductReviewByProductId(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .editProductReview(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .removeProductReview(requestData: _, queryString: _, header: let header):
            return .some(header)
        }
    }
    
    
}

