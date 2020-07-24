//
//  Errors.swift
//  Core
//
//  Created by MACPRO on 2020-03-31.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public enum AppError: Error, LocalizedError  {
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
    case genderCannotBeEmpty
    case cityCannotBeEmpty
    
    // PASSWORD
    case emailMustBeProvided
    case passwordMustBeProvided
    case passwordMustBeMoreThanEightCharacters
    case passwordMustContainCapitalLetterAndOneNumber
    case firstNameCannotBeEmpty
    
    // FOR UNKNOWNS
    case unknown(cause: Error)

    // MARK: ConnectionError

    // MARK: ConnectionError
    
    // MARK: AccountError
    case maxFreeAccountReached
    case maxVIPAccountReached
    case maxEarlyAccessAccountReached
    case exceededFreeAccount
    
    // UserError
    case notFound
    case urlError(URLError)
    case responseError(Int)
    case decodingError(DecodingError)
    case genericError
    
    // APIError
    case invalidBody
    case invalidEndpoint
    case invalidURL
    case emptyData
    case invalidJSON
    case invalidResponse
    case statusCode(Int)
    
//    public enum EmailSignUpError : Error {
//        case emailMustBeProvided
//        case passwordMustBeProvided
//        case passwordMustBeMoreThanEightCharacters
//        case passwordMustContainCapitalLetterAndOneNumber
//        case firstNameCannotBeEmpty
//        case unKnown(Error)
//    }

    var localizedDescription: String {
        switch self {
        case .ageTooYoung:
            return ""
        case .genderCannotBeEmpty:
            return ""
        case .cityCannotBeEmpty:
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
            
        // Password
        case .emailMustBeProvided:
            return ""
        case .passwordMustBeProvided:
            return ""
        case .passwordMustBeMoreThanEightCharacters:
            return ""
        case .passwordMustContainCapitalLetterAndOneNumber:
            return ""
        case .firstNameCannotBeEmpty:
            return ""
            
        // UserError
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
            
        // APIError
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









