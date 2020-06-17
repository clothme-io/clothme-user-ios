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
    
    public static func create (with value: String) -> ResultOption<Password, ValidationError> {
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
    private static func isPasswordLength (value: String) -> ResultOption<String, ValidationError> {
        return value.count > 6 ? .ok(value) : .error(ValidationError.passwordTooShort)
    }
    
    private static func validateUserEmailForEmptyValue (inputName: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func validateUserEmailForNilValue (input: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstNilString(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(ValidationError.nilValueNotAllowed)
    }
    
    private static func initPassword(_ input: String) -> ResultOption<Password, ValidationError> {
        if input.isEmpty {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        return .ok(Password(value: input))
    }
}
