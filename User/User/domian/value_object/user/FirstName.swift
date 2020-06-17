//
//  FirstName.swift
//  User
//
//  Created by MACPRO on 2020-03-25.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct FirstName : Equatable {
    
    private var _value: String;
    
    private init(value: String){
        self._value = value;
    }
    
    
    public static func create (name: String) -> ResultOption<FirstName, ValidationError> {
        return validateFirstNameForEmptyValue(inputName: name)
                .bind(validateFirstNameForNilValue)
                .bind(initFirstName)
    }
    
    public mutating func Change (name: String) -> ResultOption<FirstName, ValidationError> {
        return FirstName.validateFirstNameForEmptyValue(inputName: name)
            .bind(FirstName.validateFirstNameForNilValue)
            .bind(FirstName.initFirstName)
    }
    
    var value: String {
           return self._value
    }
   
    public func toString() -> String {
       return _value
    }
}



// MARKDOWN : Validation
extension FirstName {
    private static func validateFirstNameForEmptyValue (inputName: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func validateFirstNameForNilValue (input: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstNilString(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(ValidationError.nilValueNotAllowed)
    }
    
    private static func initFirstName(_ input: String) -> ResultOption<FirstName, ValidationError> {
        if input.isEmpty {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        return .ok(FirstName(value: input))
    }
}
