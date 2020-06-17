//
//  DateOfBirth.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct DateOfBirth : Equatable {
    
    fileprivate var date: String
    
    private init(aDate: String) {
        self.date = aDate
    }
    
    public static func create (with value: String) -> ResultOption<DateOfBirth, ValidationError> {
        return validateDateOfBirthForEmptyValue(inputName: value)
                .bind(validateDateOfBirthForNilValue)
                .bind(initDateOfBirth)
    }
    
    var value: String {
        return self.date
    }
    
}




// MARK: Validation
extension DateOfBirth {
    private static func validateDateOfBirthForEmptyValue (inputName: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func validateDateOfBirthForNilValue (input: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstNilString(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(ValidationError.nilValueNotAllowed)
    }
    
    private static func initDateOfBirth(_ input: String) -> ResultOption<DateOfBirth, ValidationError> {
        if input.isEmpty {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        return .ok(DateOfBirth(aDate: input))
    }
}
