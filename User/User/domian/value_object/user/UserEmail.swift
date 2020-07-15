//
//  UserEmail.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct UserEmail {
    private let _value: String
    
    private init(value: String) {
        _value = value
    }
    
    public static func create (value: String) -> ResultOption<UserEmail, AppError> {
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
        return emailPredicate.evaluate(with: value) ? .ok(UserEmail.init(value: value)) : .error(AppError.invalidEmail)
    }
    
    var value : String {
        return self._value
    }
    
    public mutating func change (_ name: String) -> ResultOption<UserEmail, AppError> {
        return UserEmail.validateUserEmailForEmptyValue(inputName: name)
            .bind(UserEmail.validateUserEmailForNilValue)
            .bind(UserEmail.initUserEmail)
    }
    
    public func toString() -> String {
        return _value
    }
}



// MARK: Validation
extension UserEmail {
    private static func validateUserEmailForEmptyValue (inputName: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateUserEmailForNilValue (input: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstNilString(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func initUserEmail(_ input: String) -> ResultOption<UserEmail, AppError> {
        if input.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(UserEmail(value: input))
    }
}
