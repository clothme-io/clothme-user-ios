//
//  Gender.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct Gender: Equatable {
    
    enum GenderEnum : String, Equatable {
        case Female;
        case Male;
    }
    
    private var _value: GenderEnum
    
    private init(gender: String) {
        self._value = GenderEnum.init(rawValue: gender)!
    }
    
    static func create (gender: String) -> ResultOption<Gender, ValidationError> {
        return validateForEmptyValue(input: gender)
                .bind(validateForNilValue(input:))
                .bind(initGender(genderType:))
    }
    
    var value: String {
        return self._value.rawValue
    }
    
    func toString() -> String {
        return _value.rawValue
    }
}


// MARK: Validation
extension Gender {
      private static func validateForEmptyValue (input: String) -> ResultOption<String, ValidationError> {
        let validResult = Guard.AgainstEmptyString(argument: input)
        if validResult {
            return .ok(input)
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func validateForNilValue (input: String) -> ResultOption<String, ValidationError> {
        let validResult = Guard.AgainstNilString(argument: input)
        if validResult {
            return .ok(input)
        }
        return .error(ValidationError.nilValueNotAllowed)
    }
    
    private static func initGender(genderType gender: String) -> ResultOption<Gender, ValidationError> {
        if gender.isEmpty {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        return .ok(Gender(gender: gender))
    }
}
