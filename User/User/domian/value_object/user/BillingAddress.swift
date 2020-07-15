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
    
    static func create (streetAddress: StreetAddress, city: City, country: Country) -> ResultOption<BillingAddress, AppError> {
        return validateForNilValue(streetAddress: streetAddress, city: city, country: country)
                .bind(initBillingAddress)
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
extension BillingAddress {
    private static func validateForNilValue (streetAddress: StreetAddress, city: City, country: Country) -> ResultOption<(StreetAddress, City, Country), AppError> {
         let validStreet = Guard.againstNil(argument: streetAddress)
        let validCountry = Guard.againstNil(argument: country)
         if validStreet && validCountry {
             return .ok((streetAddress, city, country))
         }
         return .error(AppError.emptyValueNotAllowed)
     }
     
    private static func initBillingAddress(streetAddress: StreetAddress, city: City, country: Country) -> ResultOption<BillingAddress, AppError> {

        return .ok(BillingAddress(streetAddress: streetAddress, city: city, country: country))
     }
}
