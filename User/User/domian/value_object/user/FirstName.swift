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
    
    
    public static func create (name: String) -> ResultOption<FirstName, AppError> {
        return validateFirstNameForEmptyValue(inputName: name)
                .bind(validateFirstNameForNilValue)
                .bind(initFirstName)
    }
    
    public mutating func Change (name: String) -> ResultOption<FirstName, AppError> {
        return FirstName.validateFirstNameForEmptyValue(inputName: name)
            .bind(FirstName.validateFirstNameForNilValue)
            .bind(FirstName.initFirstName)
    }
    
    var value: String {
           return self._value
    }
}



// MARKDOWN : Validation
extension FirstName {
    private static func validateFirstNameForEmptyValue (inputName: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateFirstNameForNilValue (input: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstNilString(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func initFirstName(_ input: String) -> ResultOption<FirstName, AppError> {
        if input.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(FirstName(value: input))
    }
}
