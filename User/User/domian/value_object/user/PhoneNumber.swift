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
    
    private init(value: String) {
        self._value = value
    }
    
    init() {
        self._value = ""
    }
    
    public static func create (with value: String) -> ResultOption<PhoneNumber, AppError> {
        return validatePhoneNumberForEmptyValue(inputName: value)
            .bind(validatePhoneNumberForNilValue)
            .bind(isMatchPhoneNumberPattern)
            .bind(initPhoneNumber)
    }
    
    public mutating func Change (with value: String) -> ResultOption<PhoneNumber, AppError> {
        return PhoneNumber.validatePhoneNumberForEmptyValue(inputName: value)
            .bind(PhoneNumber.validatePhoneNumberForNilValue)
            .bind(PhoneNumber.initPhoneNumber)
    }
    
    var Value: String {
        get {
            return self._value
        }
    }
    
    public func toString() -> String {
        return _value
    }
}



// MARK: Validation
extension PhoneNumber {
    private static func validatePhoneNumberForEmptyValue (inputName: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validatePhoneNumberForNilValue (input: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstNilString(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func isMatchPhoneNumberPattern (_ value: String) -> ResultOption<String, AppError> {
        let pattern = "^(\\([0-9]{3}\\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$"
        if value.range(of: pattern, options: .regularExpression, range: nil, locale: nil) == nil {
            return .error(AppError.invalidPhoneNumber)
        }
        return .ok(value)
    }
    
    private static func initPhoneNumber(_ input: String) -> ResultOption<PhoneNumber, AppError> {
        if input.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(PhoneNumber(value: input))
    }

}
