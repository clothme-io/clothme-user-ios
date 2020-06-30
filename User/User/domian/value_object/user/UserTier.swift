//
//  UserTier.swift
//  User
//
//  Created by MACPRO on 2020-04-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct UserTier {

    private var _tier: String
    
    private init(tier: String) {
        if tier == "free".lowercased() {
            let freeTier = FreeTier.create(tier: tier)
            self._tier = freeTier.getValue(result: freeTier)._value
        }
        
        if tier == "earlyAccess".lowercased() {
            let earlyAccess = EarlyAccessTier.set(tier: tier)
            self._tier = earlyAccess.getValue(result: earlyAccess)._value
        }
        
        if tier == "VIP".lowercased() {
            let vip = VIPTier.set(tier: tier)
            self._tier = vip.getValue(result: vip)._value
        }
        self._tier = "free"
    }
    
    public static func set (tier: String?) -> ResultOption<UserTier, ValidationError> {
        guard let tier = tier else {
            return .error(ValidationError.nilValueNotAllowed)
        }
        
        if tier == "" {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        
        return.ok(UserTier(tier: tier))
    }
    
    var type: String {
        return self._tier
    }
}

