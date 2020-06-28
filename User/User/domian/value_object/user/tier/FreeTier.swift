//
//  FreeTier.swift
//  User
//
//  Created by MACPRO on 2020-04-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

struct FreeTier : ITier {
    var _value: String
}


extension FreeTier {
    private static func noEmptyValue(input: String) -> ResultOption<String, ValidationError> {
        let tierResult = Guard.AgainstEmptyString(argument: input)
        if !tierResult {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        return .ok(input)
    }
    
    private static func noNilValue(input: String) -> ResultOption<String, ValidationError> {
        let tierResult = Guard.AgainstNilString(argument: input)
        if !tierResult {
            return .error(ValidationError.nilValueNotAllowed)
        }
        return .ok(input)
    }
    
    private static func initEarlyTier(input: String) -> ResultOption<EarlyAccessTier, ValidationError> {
        return .ok(EarlyAccessTier(tier: input))
    }
}
