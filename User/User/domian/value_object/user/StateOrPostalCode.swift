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
    
    public static func create (stateOrProvince: String) -> ResultOption<ZipOrPostalCode, ValidationError> {
        return validateForNilValue(input: stateOrProvince)
            .bind(validateForEmptyValue)
            .bind(initStateOrProvince)
    }
    
    var value: String {
           return self._value
    }
    
}


// MARK: Validation
extension ZipOrPostalCode {
    private static func validateForEmptyValue (inputCity: String) -> ResultOption<String, ValidationError> {
         let validCity = Guard.AgainstEmptyString(argument: inputCity)
         if validCity {
             return .ok(inputCity)
         }
         return .error(ValidationError.emptyValueNotAllowed)
     }
     
     private static func validateForNilValue (input: String) -> ResultOption<String, ValidationError> {
         let validCity = Guard.AgainstNilString(argument: input)
         if validCity {
             return .ok(input)
         }
         return .error(ValidationError.nilValueNotAllowed)
     }
     
     private static func initStateOrProvince(_ input: String) -> ResultOption<ZipOrPostalCode, ValidationError> {
         if input.isEmpty {
             return .error(ValidationError.emptyValueNotAllowed)
         }
         return .ok(ZipOrPostalCode(stateOrProvince: input))
     }
}
