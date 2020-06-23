//
//  AccountAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-14.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public enum AccountAPI {
    case createAccount(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case removeAccount(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case saveAndUpdateAccount(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension AccountAPI: EndPointType {
    var environmentBaseURL : String {
        let accountNetworkManager = AccountNetworkManager()
        switch accountNetworkManager.environment {
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
        case .createAccount(requestData: _, queryString: let userId, header: _):
            return "\(userId)/create_account"
        case .removeAccount(requestData: _, queryString: let userId, header: _):
            return "\(userId)/remove_account"
        case .saveAndUpdateAccount(requestData: _, queryString: let userId, header: _):
            return "\(userId)/save_and_update_account"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .createAccount:
            return .post
        case .removeAccount:
            return .delete
        case .saveAndUpdateAccount:
            return .post
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case.createAccount(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .removeAccount(requestData: let data, queryString: let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .saveAndUpdateAccount(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .createAccount(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .removeAccount(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .saveAndUpdateAccount(requestData: _, queryString: _, header: let header):
            return .some(header)
        }
    }
    
    
}
