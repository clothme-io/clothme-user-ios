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
    
    static func create(number: Int) -> ResultOption<NumberOfAccount, ValidationError> {
        return validateForNilValue(input: number)
                .bind(validateForZeroOrNegativeValue)
                .bind(initNumberOfAccount(_:))
    }
    
    var value: Int{
        return self._value
    }
}


// MARK: Validation
extension NumberOfAccount {
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
    
    private static func initNumberOfAccount(_ input: Int) -> ResultOption<NumberOfAccount, ValidationError> {
        return .ok(NumberOfAccount(number: input))
    }
}



//extension NumberOfAccount {
//    func getNumberOfAccount() -> Any {
//        switch value {
//        case .ok(let numAccount):
//            return numAccount
//        case .error(let error):
//            return error
//        }
//        
//    }
//}
