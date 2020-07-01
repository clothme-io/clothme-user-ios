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
    
    static func create(number: Int) -> ResultOption<NumberOfConnection, ValidationError> {
        return validateForNilValue(input: number)
                .bind(validateForZeroOrNegativeValue)
                .bind(initNumberOfConnection(_:))
    }
    
    var value: Int{
        return self._value
    }
}


// MARK: Validation
extension NumberOfConnection {
    private static func validateForZeroOrNegativeValue (input: Int) -> ResultOption<Int, ValidationError> {
        let validInput = Guard.againstNegative(value: Double(Int(input)))
        if validInput {
            return .ok(input)
        }
        return .error(ValidationError.negativeValueNotAllowed)
    }
    
    private static func validateForNilValue (input: Int) -> ResultOption<Int, ValidationError> {
        let validInput = Guard.AgainstZeroInt(value: input)
        if validInput {
            return .ok(input)
        }
        return .error(ValidationError.noZeroValueAllowed)
    }
    
    private static func initNumberOfConnection(_ input: Int) -> ResultOption<NumberOfConnection, ValidationError> {
        return .ok(NumberOfConnection(number: input))
    }
}


