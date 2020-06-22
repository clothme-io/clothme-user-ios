//
//  AuthAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-07.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public typealias ParameterData = [String : Any]

public enum AuthAPI {
    case signUpWithEmail(requestData: Parameters)
    case signInWithEmail(requestData: Parameters)
    case facebookSignIn(requestData: Parameters)
    case googleSignIn(requestData: Parameters)
    case resetPassword(requestData: Parameters)
    case forgotPassword(requestData: Parameters)
    case signOut(requestData: Parameters)
}

extension AuthAPI: EndPointType {
    var environmentBaseURL : String {
        let authNetworkManager = AuthNetworkManager()
        switch authNetworkManager.environment {
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
        case .facebookSignIn:
            return "/facebook_signin"
        case .googleSignIn:
            return "/google_sigin"
        case .signUpWithEmail:
            return "/signup_with_email"
        case .signInWithEmail:
            return "/signin_with_email"
        case .resetPassword(requestData: let id):
            return "\(id)/reset_password"
        case .forgotPassword:
            return "/forgot_password"
        case .signOut:
            return "/signin_out"
        }
    }
    
    public var httpMethod: HTTPMethod {
        return .post
    }
    
    public var task: HTTPTask {
        switch self {
        case.facebookSignIn(requestData: let data):
            return .requestParameters(bodyParameters: data, urlParameters: nil)
        case .signUpWithEmail(requestData: let data):
            return .requestParameters(bodyParameters: data, urlParameters: nil)
        case .signInWithEmail(requestData: let data):
            return .requestParameters(bodyParameters: data, urlParameters: nil)
        case .googleSignIn(requestData: let data):
            return .requestParameters(bodyParameters: data, urlParameters: nil)
        case .resetPassword(requestData: let data):
            return .requestParameters(bodyParameters: data, urlParameters: nil)
        case .forgotPassword(requestData: let data):
            return .requestParameters(bodyParameters: data, urlParameters: nil)
        case .signOut(requestData: let data):
            return .requestParameters(bodyParameters: data, urlParameters: nil)
        }
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
    
    
}
