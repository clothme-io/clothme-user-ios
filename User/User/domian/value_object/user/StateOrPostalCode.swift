//
//  StateOrProvince.swift
//  User
//
//  Created by MACPRO on 2020-07-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct ZipOrPostalCode {
    
    private var _value: String
    
    private init(stateOrProvince: String) {
        self._value = stateOrProvince
    }
    
    public static func create (with stateOrProvince: String) -> ResultOption<ZipOrPostalCode, AppError> {
        let validCity = Guard.againstNilValue(argument: stateOrProvince)
        if validCity {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ZipOrPostalCode(stateOrProvince: stateOrProvince))
    }
    
    var value: String {
           return self._value
    }
    
}
