//
//  NumberOfConnection.swift
//  User
//
//  Created by MACPRO on 2020-06-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct NumberOfConnection {
    private var _value: Int
    
    private init(number: Int) {
        self._value = number
    }
    
    static func create(with number: Int) -> ResultOption<NumberOfConnection, AppError> {
        let validPositiveValue = Guard.againstNegative(value: Double(Int(number)))
        if !validPositiveValue {
            return .error(AppError.negativeValueNotAllowed)
        }
        
        let validNotNilValue = Guard.againstNil(argument: number)
        if !validNotNilValue {
            return .error(AppError.noZeroValueAllowed)
        }
        return .ok(NumberOfConnection(number: number))
    }
    
    var value: Int {
        return self._value
    }
}



