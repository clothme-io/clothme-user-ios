//
//  CircleName.swift
//  Invite
//
//  Created by MACPRO on 2020-03-31.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct CircleName : Equatable {
    private var _value: String
    
    private init(name: String) {
        self._value = name
    }
    
    public static func create (name: String) -> ResultOption<CircleName, AppError> {
        return .ok(CircleName(name: name))
    }
}
