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
    
    enum TierOptions {
        case free(FreeTier)
        case earlyAccess(EarlyAccessTier)
        case Vip(VIPTier)
    }
    
    private var _tier: String
    
    private init(tier: String) {
        self._tier = tier
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

