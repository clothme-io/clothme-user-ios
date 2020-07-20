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
    
    public static func create(with value: String) -> ResultOption<UserEmail, AppError> {
        let validName = Guard.againstNilValue(argument: value)
        if validName {
            return .error(AppError.nilValueNotAllowed)
        }
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
        return emailPredicate.evaluate(with: value)
            ? .ok(UserEmail(value: value))
            : .error(AppError.invalidEmail)
    }
    
    var value : String {
        return self._value
    }
    
}
