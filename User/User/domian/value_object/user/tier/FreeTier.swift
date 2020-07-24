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
       let tierResult = Guard.againstNilValue(argument: tier)
       if !tierResult {
           return .error(AppError.nilValueNotAllowed)
       }
        return .ok(FreeTier(tier: tier))
    }
}

