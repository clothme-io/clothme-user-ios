//
//  AllowedAccount.swift
//  User
//
//  Created by MACPRO on 2020-04-20.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

struct AllowedAccount {
    private let _freeTier: Int
    private let _earlyAccess: Int
    private let _VIPTier: Int
    
    private init () {
        self._freeTier = 3
        self._earlyAccess = 7
        self._VIPTier = 10
    }
    
    static func get() -> AllowedAccount {
        return AllowedAccount()
    }
    
    var free : Int {
        return self._freeTier
    }
    
    var earlyAccess: Int {
        return self._earlyAccess
    }
    
    var VIP: Int {
        return self._VIPTier
    }
}
