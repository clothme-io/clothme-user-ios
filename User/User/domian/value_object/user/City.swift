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
    
    public static func create (withCity city: String) -> ResultOption<City, AppError> {
       let validCity = Guard.againstNilValue(argument: city)
        if !validCity {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(City(city: city))
    }
    
    var value: String {
           return self._value
    }
    
}
