//
//  Errors.swift
//  Core
//
//  Created by MACPRO on 2020-03-31.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public enum ValidationError: Error, LocalizedError  {
    case emptyValueNotAllowed
    case nilValueNotAllowed
    case invalidPhoneNumber
    case invalidEmail
    case passwordTooShort
    case passwordTooWeak
    case ageTooYoung
    case alreadyExist
    case sameValueNotAllowed
    case negativeValueNotAllowed
    case noZeroValueAllowed
    
    // FOR UNKNOWNS
    case unknown(cause: Error)
    
    // ACCOUNT ERROR
    case maxFreeAccountReached
    case maxVIPAccountReached
    case maxEarlyAccessAccountReached
    case exceededFreeAccount
    
    var localizedDescription: String {
        switch self {
        case .ageTooYoung:
            return ""
        case .alreadyExist:
            return ""
        case .emptyValueNotAllowed:
            return ""
        case .exceededFreeAccount:
            return ""
        case .invalidEmail:
            return ""
        case .invalidPhoneNumber:
            return ""
        case .maxEarlyAccessAccountReached:
            return ""
        case .maxFreeAccountReached:
            return ""
        case .maxVIPAccountReached:
            return ""
        case .negativeValueNotAllowed:
            return ""
        case .nilValueNotAllowed:
            return ""
        case .noZeroValueAllowed:
            return ""
        case .passwordTooShort:
            return ""
        case .passwordTooWeak:
            return ""
        case .sameValueNotAllowed:
            return ""
        case .unknown(cause: let errorValue):
            return "\(errorValue)"
            
        }
    }

}


// APIError
public enum APIError: Error, LocalizedError {
    case invalidBody
    case invalidEndpoint
    case invalidURL
    case emptyData
    case invalidJSON
    case invalidResponse
    case statusCode(Int)
    
    var localizedDescription: String {
        switch self {
        case .invalidBody:
            return ""
        case .invalidEndpoint:
            return ""
        case .invalidURL:
            return ""
        case .emptyData:
            return ""
        case .invalidJSON:
            return ""
        case .invalidResponse:
            return ""
        case .statusCode(let intValue):
            return " \(intValue)"
        }
    }
}


//AuthError
public enum AuthError : Error, LocalizedError {
    
}

// UserError
public enum UserError : Error, LocalizedError {
    case notFound
    case urlError(URLError)
    case responseError(Int)
    case decodingError(DecodingError)
    case genericError
    
    var localizedDescription: String {
        switch self {
        case .urlError(let error):
            return error.localizedDescription
        case .decodingError(let error):
            return error.localizedDescription
        case .responseError(let status):
            return "Bad response code: \(status)"
        case .genericError:
            return "An unknown error has been occured"
        case .notFound:
            return "Not found"
        }
    }
}


// AccountError
public enum AccountError : Error, LocalizedError {
    
}


// ConnectionError
public enum ConnectionError : Error, LocalizedError {
    
}


// MARK: ConnectionError
public enum MeasurementError : Error, LocalizedError {
    
}


