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
    
    public static func create (with value: String) -> ResultOption<DateOfBirth, AppError> {
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
    private static func validateDateOfBirthForEmptyValue (inputName: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateDateOfBirthForNilValue (input: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstNilString(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func initDateOfBirth(_ input: String) -> ResultOption<DateOfBirth, AppError> {
        if input.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(DateOfBirth(aDate: input))
    }
}
