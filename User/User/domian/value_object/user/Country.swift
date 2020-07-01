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
    
    public static func set (country: String) -> ResultOption<Country, ValidationError> {
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
     
     private static func initCountry(_ input: String) -> ResultOption<Country, ValidationError> {
         if input.isEmpty {
             return .error(ValidationError.emptyValueNotAllowed)
         }
         return .ok(Country(country: input))
     }
}
