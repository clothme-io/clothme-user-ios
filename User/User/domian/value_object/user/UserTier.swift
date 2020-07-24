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

    private var _tier: String?
    
    private init(tier: String) {
        if tier == "free".lowercased() {
            let fTier = FreeTier.create(tier: tier)
            let freeTier = fTier.OptionalValue(result: fTier).optionalData?._value
            self._tier = freeTier
        }
        
        if tier == "earlyAccess".lowercased() {
            let eAccess = EarlyAccessTier.create(tier: tier)
            let earlyAccess = eAccess.OptionalValue(result: eAccess).optionalData?._value
            self._tier = earlyAccess
        }
        
        if tier == "VIP".lowercased() {
            let vAccess = VIPTier.create(tier: tier)
            let vip = vAccess.OptionalValue(result: vAccess).optionalData?._value
            self._tier = vip
        }
        self._tier = "free"
    }
    
    public static func set (tier: String?) -> ResultOption<UserTier, AppError> {
        guard let tier = tier else {
            return .error(AppError.nilValueNotAllowed)
        }
        
        if tier == "" {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        return.ok(UserTier(tier: tier))
    }
    
    var type: String? {
        return self._tier
    }
}

