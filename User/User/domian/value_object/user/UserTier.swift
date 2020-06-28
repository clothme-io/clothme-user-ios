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
    private var _tier: ITier
    
    private init(tier: ITier?) {
        self._tier = tier ?? TierOptions.free(FreeTier.init(_value: "free")) as! ITier
    }
    
    public static func set (tier: ITier?) -> ResultOption<UserTier, ValidationError> {
        return.ok(UserTier(tier: tier))
    }
    
    var type: ITier {
        return self._tier
    }
}

