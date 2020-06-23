//
//  ConnectionAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-14.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public enum ConnectionAPI {
    case getAllConnection(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case removeConnection(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getConnectionByConnectionId(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case acceptConnection(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case declineConnection(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case sendConnection(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension ConnectionAPI: EndPointType {
      var environmentBaseURL : String {
        let connectionNetworkManager = ConnectionNetworkManager()
        switch connectionNetworkManager.environment {
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
        case .getAllConnection(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_all_connection"
        case .removeConnection(requestData: _, queryString: let userId, header: _):
            return "\(userId)/remove_connection"
        case .getConnectionByConnectionId(requestData: _, queryString: let userId, header: _):
            return "\(userId)/get_connection_by_connection_id"
        case .acceptConnection(requestData: _, queryString: let userId, header: _):
            return "\(userId)/accept_connection"
        case .declineConnection(requestData: _, queryString: let userId, header: _):
            return "\(userId)/decline_connection"
        case .sendConnection(requestData: _, queryString: let userId, header: _):
            return "\(userId)/send_connection"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .getAllConnection:
            return .get
        case .removeConnection:
            return .post
        case .getConnectionByConnectionId:
            return .get
        case .acceptConnection:
            return .post
        case .declineConnection:
            return .patch
        case .sendConnection:
            return .post
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case.getAllConnection(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getConnectionByConnectionId(requestData: _, queryString: let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: queryString, additionHeaders: headers)
        case .acceptConnection(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .removeConnection(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .sendConnection(requestData: let data, let queryString, header: let headers):
                return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .declineConnection(requestData: let data, let queryString, header: let headers):
                return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .getAllConnection(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getConnectionByConnectionId(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .acceptConnection(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .removeConnection(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .declineConnection(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .sendConnection(requestData: _, queryString: _, header: let header):
            return .some(header)
        }
    }
    
    
}
