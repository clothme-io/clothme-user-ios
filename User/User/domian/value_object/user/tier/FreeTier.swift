//
//  FreeTier.swift
//  User
//
//  Created by MACPRO on 2020-04-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct FreeTier {
    var _value: String
    
    private init(tier: String) {
        self._value = tier
    }
    
    static func create(tier: String) -> ResultOption<FreeTier, AppError> {
        return noEmptyValue(input: tier)
        .bind(noNilValue(input:))
        .bind(initFreeTier(input:))
    }
}


extension FreeTier {
    private static func noEmptyValue(input: String) -> ResultOption<String, AppError> {
        let tierResult = Guard.AgainstEmptyString(argument: input)
        if !tierResult {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(input)
    }
    
    private static func noNilValue(input: String) -> ResultOption<String, AppError> {
        let tierResult = Guard.AgainstNilString(argument: input)
        if !tierResult {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(input)
    }
    
    private static func initFreeTier(input: String) -> ResultOption<FreeTier, AppError> {
        return .ok(FreeTier(tier: input))
    }
}
