//
//  AllowedConnections.swift
//  User
//
//  Created by MACPRO on 2020-06-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

struct AllowedConnection {
  private let _freeTier: Int
    private let _earlyAccess: Int
    private let _VIPTier: Int
    
    private init () {
        self._freeTier = 3000
        self._earlyAccess = 7000
        self._VIPTier = 100000
    }
    
    static func get() -> AllowedConnection {
        return AllowedConnection()
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
