//
//  VIPTier.swift
//  User
//
//  Created by MACPRO on 2020-04-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct VIPTier {
    
    var _value: String
    
    private init(tier: String) {
        self._value = tier
    }
    
    public static func create(tier: String) -> ResultOption<VIPTier, AppError> {
        let tierResult = Guard.againstNilValue(argument: tier)
        if !tierResult {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(VIPTier(tier: tier))
    }
    
}
