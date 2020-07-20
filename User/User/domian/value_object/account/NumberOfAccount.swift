//
//  NumberOfAccount.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct NumberOfAccount {
    private var _value: Int
    
    private init(number: Int) {
        self._value = number
    }
    
    static func create(with number: Int) -> ResultOption<NumberOfAccount, AppError> {
        if (!validateForZeroOrNegativeValue(input: number)) {
            return .error(AppError.noZeroValueAllowed)
        }
        return .ok(NumberOfAccount(number: number))
    }
    
    var value: Int{
        return self._value
    }
}


// MARK: Validation
extension NumberOfAccount {
    private static func validateForZeroOrNegativeValue(input: Int) -> Bool {
        let validInput = Guard.againstNegative(value: Double(Int(input)))
        if validInput {
            return false
        }
        return true
    }
}


