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
    private var _stateOrPostalCode: City
    private var _country: Country
    
    private init(streetAddress: StreetAddress, city: City, stateOrPostalCode: City, country: Country) {
        self._streetAddress = streetAddress
        self._city = city
        self._stateOrPostalCode = stateOrPostalCode
        self._country = country
    }
    
    static func create (streetAddress: StreetAddress, city: City, stateOrPostalCode: City, country: Country) -> ResultOption<ShippingAddress, ValidationError> {
        return validateForNilValue(streetAddress: streetAddress, city: city, stateOrPostalCode: stateOrPostalCode, country: country)
                .bind(initShippingAddress)
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
    
}


// MARK: Validation
extension ShippingAddress {
    private static func validateForNilValue (streetAddress: StreetAddress, city: City, stateOrPostalCode: City, country: Country) -> ResultOption<(StreetAddress, City, City, Country), ValidationError> {
        let validStreet = Guard.againstNil(argument: streetAddress)
        let validCity = Guard.againstNil(argument: city)
        let validStateOrPostalCode = Guard.againstNil(argument: stateOrPostalCode)
        let validCountry = Guard.againstNil(argument: country)
         if validStreet && validCity && validStateOrPostalCode && validCountry {
             return .ok((streetAddress, city, city, country))
         }
         return .error(ValidationError.emptyValueNotAllowed)
     }
     
    private static func initShippingAddress(streetAddress: StreetAddress, city: City, stateOrPostalCode: City, country: Country) -> ResultOption<ShippingAddress, ValidationError> {
        return .ok(ShippingAddress(streetAddress: streetAddress, city: city, stateOrPostalCode: stateOrPostalCode, country: country))
     }
}
