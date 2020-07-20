//
//  ShippingAddress.swift
//  User
//
//  Created by MACPRO on 2020-04-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct ShippingAddress {
    
    private var _streetAddress: StreetAddress
    private var _city: City
    private var _stateOrPostalCode: ZipOrPostalCode
    private var _country: Country
    
    private init(streetAddress: StreetAddress, city: City, stateOrPostalCode: ZipOrPostalCode, country: Country) {
        self._streetAddress = streetAddress
        self._city = city
        self._stateOrPostalCode = stateOrPostalCode
        self._country = country
    }
    
    static func create (with streetAddress: StreetAddress, with city: City, with stateOrPostalCode: ZipOrPostalCode, and country: Country) -> ResultOption<ShippingAddress, AppError> {
        if (!validateForNilValue(streetAddress: streetAddress, city: city, stateOrPostalCode: stateOrPostalCode, country: country)) {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ShippingAddress(streetAddress: streetAddress, city: city, stateOrPostalCode: stateOrPostalCode, country: country))
    }
    
    var streetAddress: StreetAddress {
        return self._streetAddress
    }
    
    var city: City {
        return self._city
    }
    
    var country: Country {
        return self._country
    }
    
    var stateOrPostalCode: ZipOrPostalCode {
        return self._stateOrPostalCode
    }
}


// MARK: Validation
extension ShippingAddress {
    private static func validateForNilValue(streetAddress: StreetAddress, city: City, stateOrPostalCode: ZipOrPostalCode, country: Country) -> Bool {
        let validStreet = Guard.againstNil(argument: streetAddress)
        let validCity = Guard.againstNil(argument: city)
        let validStateOrPostalCode = Guard.againstNil(argument: stateOrPostalCode)
        let validCountry = Guard.againstNil(argument: country)
         if !validStreet || !validCity || !validStateOrPostalCode || !validCountry {
             return false
         }
         return true
     }
}

