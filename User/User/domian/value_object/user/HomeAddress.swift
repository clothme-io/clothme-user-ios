//
//  HomeAddress.swift
//  User
//
//  Created by MACPRO on 2020-04-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct HomeAddress {
    
    private var _streetAddress: StreetAddress
    private var _city: City
    private var _country: Country
    
    private init(streetAddress: StreetAddress, city: City, country: Country) {
        self._streetAddress = streetAddress
        self._city = city
        self._country = country
    }
    
    static func create (streetAddress: StreetAddress, city: City, country: Country) -> ResultOption<HomeAddress, ValidationError> {
        return validateForNilValue(streetAddress: streetAddress, city: city, country: country)
                .bind(initHomeAddress)
    }
    
}


// MARK: Validation
extension HomeAddress {
    private static func validateForNilValue (streetAddress: StreetAddress, city: City, country: Country) -> ResultOption<(StreetAddress, City, Country), ValidationError> {
        let validStreet = Guard.againstNil(argument: streetAddress)
        let validCity = Guard.againstNil(argument: city)
        let validCountry = Guard.againstNil(argument: country)
         if validStreet && validCity && validCountry {
             return .ok((streetAddress, city, country))
         }
         return .error(ValidationError.emptyValueNotAllowed)
     }
     
    private static func initHomeAddress(streetAddress: StreetAddress, city: City, country: Country) -> ResultOption<HomeAddress, ValidationError> {
         return .ok(HomeAddress(streetAddress: streetAddress, city: city, country: country))
     }
}
