//
//  Country.swift
//  User
//
//  Created by MACPRO on 2020-04-01.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct Country {
    
    private var _value: String
    
    private init(country: String) {
        self._value = country
    }
    
    public static func set (country: String) -> ResultOption<Country, AppError> {
        return validateForNilValue(input: country)
            .bind(validateForEmptyValue)
            .bind(initCountry)
    }
    
    var value: String {
           return self._value
    }
    
}


// MARK: Validation
extension Country {
    private static func validateForEmptyValue (inputCity: String) -> ResultOption<String, AppError> {
         let validCity = Guard.AgainstEmptyString(argument: inputCity)
         if validCity {
             return .ok(inputCity)
         }
         return .error(AppError.emptyValueNotAllowed)
     }
     
     private static func validateForNilValue (input: String) -> ResultOption<String, AppError> {
         let validCity = Guard.againstNilValue(argument: input)
         if validCity {
             return .ok(input)
         }
         return .error(AppError.nilValueNotAllowed)
     }
     
     private static func initCountry(_ input: String) -> ResultOption<Country, AppError> {
         if input.isEmpty {
             return .error(AppError.emptyValueNotAllowed)
         }
         return .ok(Country(country: input))
     }
}
