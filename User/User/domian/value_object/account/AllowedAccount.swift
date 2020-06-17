//
//  AllowedAccount.swift
//  User
//
//  Created by MACPRO on 2020-04-20.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

struct AllowedAccount {
    private var _free: Int
    private var _max: Int
    
    private init () {
        self._free = 3
        self._max = 7
    }
    
    static func get() -> AllowedAccount {
        return AllowedAccount()
    }
    
    var free : Int {
        return self._free
    }
    
    var max: Int {
        return self._max
    }
}
