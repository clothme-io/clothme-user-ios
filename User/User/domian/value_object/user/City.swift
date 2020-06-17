//
//  City.swift
//  User
//
//  Created by MACPRO on 2020-04-20.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct City: Equatable {
    
    private var _value: String
    
    private init(city: String) {
        self._value = city
    }
    
    public static func create (city: String) -> ResultOption<City, ValidationError> {
        return validateForNilValue(input: city)
                .bind(validateForEmptyValue)
                .bind(initCountry)
    }
    
    var value: String {
           return self._value
    }
    
    public func toString() -> String {
        return _value
    }
    
}


// MARK: Validation
extension City {
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
     
     private static func initCountry(_ input: String) -> ResultOption<City, ValidationError> {
         if input.isEmpty {
             return .error(ValidationError.emptyValueNotAllowed)
         }
        return .ok(City(city: input))
     }
}
