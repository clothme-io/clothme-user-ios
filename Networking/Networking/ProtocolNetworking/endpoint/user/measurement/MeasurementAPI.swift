//
//  MeasurementAPI.swift
//  Networking
//
//  Created by MACPRO on 2020-06-14.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public enum MeasurementAPI {
    case acceptMeasurement(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case getMeasurement(queryString: Parameters, header: HTTPHeaders)
    case addMeasurement(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case sendMeasurement(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case declineMeasurement(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case requestMeasurement(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
    case editMeasurement(requestData: Parameters, queryString: Parameters, header: HTTPHeaders)
}

extension MeasurementAPI: EndPointType {
    
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
        case .acceptMeasurement(requestData: _, queryString: let id, header: _):
            return "\(id)/accept_measurement"
        case .addMeasurement(requestData: _, queryString: let id, header: _):
            return "\(id)/add_measurement"
        case .declineMeasurement(requestData: _, queryString: let id, header: _):
            return "\(id)/decline_measurment"
        case .editMeasurement(requestData: _, queryString: let id, header: _):
            return "\(id)/edit_measurement"
        case .getMeasurement(queryString: let id, header: _):
            return "\(id)/get_measurement"
        case .requestMeasurement(requestData: _, queryString: let id, header: _):
            return "\(id)/request_measurement"
        case .sendMeasurement(requestData: _, queryString: let id, header: _):
            return "\(id)/send_measurement"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .addMeasurement:
            return .post
        case .acceptMeasurement:
            return .post
        case .declineMeasurement:
            return .post
        case .editMeasurement:
            return .post
        case .getMeasurement:
            return .get
        case .requestMeasurement:
            return .post
        case .sendMeasurement:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .acceptMeasurement(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .addMeasurement(requestData: _, queryString: let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: queryString, additionHeaders: headers)
        case .declineMeasurement(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .editMeasurement(requestData: let data, let queryString, header: let headers):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: queryString, additionHeaders: headers)
        case .getMeasurement(queryString: let id, header: let header):
            return .requestParametersAndHeaders(bodyParameters: nil, urlParameters: id, additionHeaders: header)
        case .requestMeasurement(requestData: let data, queryString: let id, header: let header):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: id, additionHeaders: header)
        case .sendMeasurement(requestData: let data, queryString: let id, header: let header):
            return .requestParametersAndHeaders(bodyParameters: data, urlParameters: id, additionHeaders: header)
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .acceptMeasurement(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .addMeasurement(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .declineMeasurement(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .editMeasurement(requestData: _, queryString: _, header: let header):
            return .some(header)
        case .getMeasurement(queryString: _, header: let header):
            return .init(header)
        case .requestMeasurement(requestData: _, queryString: _, header: let header):
            return .init(header)
        case .sendMeasurement(requestData: _, queryString: _, header: let header):
            return .init(header)
        }
    }
    
    
}
