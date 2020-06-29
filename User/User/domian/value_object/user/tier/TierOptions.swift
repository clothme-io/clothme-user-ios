//
//  TierOptions.swift
//  User
//
//  Created by MACPRO on 2020-06-02.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

enum TierOptions {
    case free(FreeTier)
    case earlyAccess(EarlyAccessTier)
    case Vip(VIPTier)
}

extension TierOptions {
    init(tier: String) {
        if tier == "free".lowercased() {
            let freeTier = FreeTier.create(tier: tier)
            self = .free(freeTier.getValue(result: freeTier))
        }
    }
}
