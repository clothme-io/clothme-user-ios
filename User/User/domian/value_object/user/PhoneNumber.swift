//
//  PhoneNumber.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct PhoneNumber : Equatable {
    
    private var _value: String;
    private var _type: String
    
    private init(value: String, type: String) {
        self._value = value
        self._type = type
    }
    
    public static func create (value: String, type: String) -> ResultOption<PhoneNumber, AppError> {
        let pattern = "^(\\([0-9]{3}\\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$"
        if value.range(of: pattern, options: .regularExpression, range: nil, locale: nil) == nil {
            return .error(AppError.invalidPhoneNumber)
        }
        let validName = Guard.againstNilValue(argument: value)
        let validType = Guard.againstNilValue(argument: type)
        if !validName || !validType {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(PhoneNumber(value: value, type: type))
    }
    
//    public mutating func Change (_ value: String, _ type: String) -> ResultOption<PhoneNumber, AppError> {
//        let pattern = "^(\\([0-9]{3}\\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$"
//        if value.range(of: pattern, options: .regularExpression, range: nil, locale: nil) == nil {
//            return .error(AppError.invalidPhoneNumber)
//        }
//        let validName = Guard.againstNilValue(argument: value)
//        let validType = Guard.againstNilValue(argument: type)
//        if !validName && validType {
//            return .error(AppError.nilValueNotAllowed)
//        }
//    }
    
    var value: String {
        return self._value
    }
    
    var type: String {
        return self._type
    }
}


