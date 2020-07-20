//
//  PhoneNumber.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct PhoneNumber : Equatable {
    
    private var _value: String;
    private var _type: String
    
    private init(value: String, type: String) {
        self._value = value
        self._type = type
    }
    
    public static func create (_ value: String, type: String) -> ResultOption<PhoneNumber, AppError> {
        return validatePhoneNumberForEmptyValue(value: value, type: type)
            .bind(validatePhoneNumberForNilValue)
            .bind(isMatchPhoneNumberPattern)
            .bind(initPhoneNumber)
    }
    
    public mutating func Change (_ value: String, _ type: String) -> ResultOption<PhoneNumber, AppError> {
        return PhoneNumber.validatePhoneNumberForEmptyValue(value: value, type: type)
            .bind(PhoneNumber.validatePhoneNumberForNilValue)
            .bind(PhoneNumber.initPhoneNumber)
    }
    
    var value: String {
        get {
            return self._value
        }
    }
    
    var type: String {
        get {
            return self._type
        }
    }
}



// MARK: Validation
extension PhoneNumber {
    private static func validatePhoneNumberForEmptyValue (value: String, type: String) -> ResultOption<(String, String), AppError> {
        let validName = Guard.AgainstEmptyString(argument: value)
        let validType = Guard.AgainstEmptyString(argument: type)
        if validName && validType {
            return .ok((value, type))
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validatePhoneNumberForNilValue (value: String, type: String) -> ResultOption<(String, String), AppError> {
        let validName = Guard.againstNilValue(argument: value)
        let validType = Guard.againstNilValue(argument: type)
        if validName && validType {
            return .ok((value, type))
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func isMatchPhoneNumberPattern (_ value: String, _ type: String) -> ResultOption<(String, String), AppError> {
        let pattern = "^(\\([0-9]{3}\\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$"
        if value.range(of: pattern, options: .regularExpression, range: nil, locale: nil) == nil {
            return .error(AppError.invalidPhoneNumber)
        }
        return .ok((value, type))
    }
    
    private static func initPhoneNumber(_ value: String, _ type: String) -> ResultOption<PhoneNumber, AppError> {
        if value.isEmpty || type.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(PhoneNumber(value: value, type: type))
    }

}
