//
//  Profession.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct Profession : Equatable {
    private let _value: String;
    
    private init(_ profession: String){
        self._value = profession;
    }
    
    public static func create (nameWith profession: String) -> ResultOption<Profession, ValidationError> {
        return validateForNilValue(input: profession)
        .bind(validateForEmptyValue)
        .bind(initProfession(_:))
    }
    
    public func change (newProfession new: String, oldProfession old: Profession) -> ResultOption<Profession, ValidationError> {
        if new == old._value {
            return .error(ValidationError.sameValueNotAllowed)
        }
        return Profession.validateForEmptyValue(input: new)
            .bind(Profession.validateForNilValue)
            .bind(Profession.initProfession(_:))
    }
    
    var value: String {
           return self._value
    }
    
    public func toString() -> String {
        return _value
    }
    
}



// MARK: Validation
extension Profession {
    private static func validateForEmptyValue (input: String) -> ResultOption<String, ValidationError> {
        let validProfession = Guard.AgainstEmptyString(argument: input)
        if validProfession {
            return .ok(input)
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func validateForNilValue (input: String) -> ResultOption<String, ValidationError> {
        let validProfession = Guard.AgainstNilString(argument: input)
        if validProfession {
            return .ok(input)
        }
        return .error(ValidationError.nilValueNotAllowed)
    }
    
    private static func initProfession(_ input: String) -> ResultOption<Profession, ValidationError> {
        if input.isEmpty {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        return .ok(Profession(input))
    }
}
