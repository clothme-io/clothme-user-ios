//
//  ConnectionAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-14.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public enum ConnectionAPI {
    case getUserById(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case editUser(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case blockUser(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case removeUser(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension ConnectionAPI: EndPointType {
    
    var environmentBaseURL : String {
        switch UserNetworkManager.environment {
        case .production: return "https://getclothme.com/prod/api"
        case .qa: return "https://getclothme.com/qa/api"
        case .staging: return "https://getclothme.com/staging/api"
        }
    }
    
    var baseUrl: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .blockUser(requestData: let id):
            return "\(id)/block_user"
        case .removeUser(requestData: let id):
            return "\(id)/remove_user"
        case .getUserById(requestData: let id):
            return "\(id)/get_user_by_id"
        case .editUser(requestData: let id):
            return "\(id)/edit_user"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .blockUser:
            return .post
        case .editUser:
            return .put
        case .getUserById:
            return .get
        case .removeUser:
            return .delete
        }
    }
    
    var task: HTTPTask {
        switch self {
        case.blockUser(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getUserById(requestData: _, queryString: let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: queryString, additionHeaders: headers)
        case .editUser(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .removeUser(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .blockUser(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getUserById(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .editUser(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .removeUser(requestData: _, queryString: _, header: let header):
            return .some(header)
        }
    }
    
    
}
