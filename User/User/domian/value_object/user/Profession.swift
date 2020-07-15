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
    
    public static func create (nameWith profession: String) -> ResultOption<Profession, AppError> {
        return validateForNilValue(input: profession)
        .bind(validateForEmptyValue)
        .bind(initProfession(_:))
    }
    
    public func change (newProfession new: String, oldProfession old: Profession) -> ResultOption<Profession, AppError> {
        if new == old._value {
            return .error(AppError.sameValueNotAllowed)
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
    private static func validateForEmptyValue (input: String) -> ResultOption<String, AppError> {
        let validProfession = Guard.AgainstEmptyString(argument: input)
        if validProfession {
            return .ok(input)
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateForNilValue (input: String) -> ResultOption<String, AppError> {
        let validProfession = Guard.AgainstNilString(argument: input)
        if validProfession {
            return .ok(input)
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func initProfession(_ input: String) -> ResultOption<Profession, AppError> {
        if input.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(Profession(input))
    }
}
