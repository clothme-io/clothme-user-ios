//
//  EarlyAccess.swift
//  User
//
//  Created by MACPRO on 2020-04-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct EarlyAccessTier  {
    
    var _value: String
    
    private init(tier: String) {
        self._value = tier
    }
    
    static func create(tier: String) -> ResultOption<EarlyAccessTier, AppError> {
       let tierResult = Guard.againstNilValue(argument: tier)
       if !tierResult {
           return .error(AppError.nilValueNotAllowed)
       }
        return .ok(EarlyAccessTier(tier: tier))
    }
}
