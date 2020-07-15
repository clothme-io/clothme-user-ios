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
    
    public static func create (stateOrProvince: String) -> ResultOption<ZipOrPostalCode, AppError> {
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
    private static func validateForEmptyValue (inputCity: String) -> ResultOption<String, AppError> {
         let validCity = Guard.AgainstEmptyString(argument: inputCity)
         if validCity {
             return .ok(inputCity)
         }
         return .error(AppError.emptyValueNotAllowed)
     }
     
     private static func validateForNilValue (input: String) -> ResultOption<String, AppError> {
         let validCity = Guard.AgainstNilString(argument: input)
         if validCity {
             return .ok(input)
         }
         return .error(AppError.nilValueNotAllowed)
     }
     
     private static func initStateOrProvince(_ input: String) -> ResultOption<ZipOrPostalCode, AppError> {
         if input.isEmpty {
             return .error(AppError.emptyValueNotAllowed)
         }
         return .ok(ZipOrPostalCode(stateOrProvince: input))
     }
}
