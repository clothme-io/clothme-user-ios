//
//  Password.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct Password {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create(with password: String) -> ResultOption<Password, AppError> {
        if password.count < 6 {
            return .error(AppError.passwordTooShort)
        }
        let validPassword = Guard.againstNilValue(argument: password)
        if !validPassword {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(Password(value: password))
    }
    
    var Value: String {
        return self._value;
    }
}

