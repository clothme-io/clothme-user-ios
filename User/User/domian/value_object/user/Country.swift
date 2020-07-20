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
        let validCountry = Guard.againstNilValue(argument: country)
        if !validCountry {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(Country(country: country))
    }
    
    var value: String {
           return self._value
    }
    
}
