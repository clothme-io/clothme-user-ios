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
        case none;
    }
    
    private var _value: String?
    
    private init(gender: String?) {
        self._value = GenderEnum.init(rawValue: gender ?? "").map { $0.rawValue }
    }
    
    static func create (gender: String) -> ResultOption<Gender, AppError> {
        let validResult = Guard.againstNilValue(argument: gender)
        if !validResult {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(Gender(gender: gender))
    }
    
    var value: String? {
        return self._value
    }
    
}

