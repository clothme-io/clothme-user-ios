//
//  LastName.swift
//  User
//
//  Created by MACPRO on 2020-03-25.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct LastName: Equatable {
    private let _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create (value: String) -> ResultOption<LastName, ValidationError> {
        return validateLastNameForEmptyValue(inputName: value)
            .bind(validateLastNameForNilValue)
            .bind(initLastName)
    }
    
    public mutating func change (_ name: String) -> ResultOption<LastName, ValidationError> {
        return LastName.validateLastNameForEmptyValue(inputName: name)
            .bind(LastName.validateLastNameForNilValue)
            .bind(LastName.initLastName)
    }
    
    var value: String {
        return self._value
    }
    
    public func toString() -> String {
        return _value
    }
}


// MARKDOWN : Validation
extension LastName {
    
    private static func validateLastNameForEmptyValue (inputName: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func validateLastNameForNilValue (input: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstNilString(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(ValidationError.nilValueNotAllowed)
    }
    
    private static func initLastName(input: String) -> ResultOption<LastName, ValidationError> {
        if input.isEmpty {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        return .ok(LastName(value: input))
    }
}
