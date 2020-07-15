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
    
    public static func create (city: String) -> ResultOption<City, AppError> {
        return validateForNilValue(input: city)
                .bind(validateForEmptyValue)
                .bind(initCountry)
    }
    
    var value: String {
           return self._value
    }
    
}


// MARK: Validation
extension City {
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
     
     private static func initCountry(_ input: String) -> ResultOption<City, AppError> {
         if input.isEmpty {
             return .error(AppError.emptyValueNotAllowed)
         }
        return .ok(City(city: input))
     }
}
