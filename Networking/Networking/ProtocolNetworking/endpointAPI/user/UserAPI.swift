//
//  UserAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public enum UserAPI {
    case getUserById(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case editUser(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case blockUser(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case removeUser(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension UserAPI: EndPointType {
    
    var environmentBaseURL : String {
        switch UserNetworkManager.environment {
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
        case .blockUser(requestData: _, queryString: let userId, header: _):
        return "\(userId)/block_user"
        case .removeUser(requestData: _, queryString: let userId, header: _):
        return "\(userId)/remove_user"
        case .getUserById(requestData: _, queryString: let userId, header: _):
        return "\(userId)/get_user_by_id"
        case .editUser(requestData: _, queryString: let userId, header: _):
        return "\(userId)/edit_user"
        }
    }
    
    public var httpMethod: HTTPMethod {
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
    
    public var task: HTTPTask {
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
    
    public var headers: HTTPHeaders? {
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
