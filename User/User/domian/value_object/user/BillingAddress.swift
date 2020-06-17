//
//  BillingAddress.swift
//  User
//
//  Created by MACPRO on 2020-04-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct BillingAddress {

    private var _streetAddress: StreetAddress
    private var _city: City
    private var _country: Country
    
    private init(streetAddress: StreetAddress, city: City, country: Country) {
        self._streetAddress = streetAddress
        self._city = city
        self._country = country
    }
    
    static func create (streetAddress: StreetAddress, city: City, country: Country) -> ResultOption<BillingAddress, ValidationError> {
        return validateForNilValue(streetAddress: streetAddress, city: city, country: country)
                .bind(initBillingAddress)
    }
}

// MARK: Validation
extension BillingAddress {
    private static func validateForNilValue (streetAddress: StreetAddress, city: City, country: Country) -> ResultOption<(StreetAddress, City, Country), ValidationError> {
         let validStreet = Guard.againstNil(argument: streetAddress)
        let validCountry = Guard.againstNil(argument: country)
         if validStreet && validCountry {
             return .ok((streetAddress, city, country))
         }
         return .error(ValidationError.emptyValueNotAllowed)
     }
     
    private static func initBillingAddress(streetAddress: StreetAddress, city: City, country: Country) -> ResultOption<BillingAddress, ValidationError> {

        return .ok(BillingAddress(streetAddress: streetAddress, city: city, country: country))
     }
}
