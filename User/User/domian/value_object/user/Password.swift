//
//  Password.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct Password {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create (with value: String) -> ResultOption<Password, AppError> {
        return validateUserEmailForEmptyValue(inputName: value)
                .bind(validateUserEmailForNilValue)
                .bind(isPasswordLength)
                .bind(initPassword)
    }
    
    var Value: String {
        get {
            return self._value;
        }
    }
    
    public mutating func change () {}
}


// MARK: Validation
extension Password {
    private static func isPasswordLength (value: String) -> ResultOption<String, AppError> {
        return value.count > 6 ? .ok(value) : .error(AppError.passwordTooShort)
    }
    
    private static func validateUserEmailForEmptyValue (inputName: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateUserEmailForNilValue (input: String) -> ResultOption<String, AppError> {
        let validName = Guard.againstNilValue(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func initPassword(_ input: String) -> ResultOption<Password, AppError> {
        if input.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(Password(value: input))
    }
}
