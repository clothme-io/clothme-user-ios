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
    private var _zipOrPostalCode: ZipOrPostalCode
    private var _country: Country
    
    private init(streetAddress: StreetAddress, city: City, zipOrPostalCode: ZipOrPostalCode, country: Country) {
        self._streetAddress = streetAddress
        self._city = city
        self._zipOrPostalCode = zipOrPostalCode
        self._country = country
    }
    
    static func create (with streetAddress: StreetAddress, with city: City, with zipOrPostalCode: ZipOrPostalCode, with country: Country) -> ResultOption<BillingAddress, AppError> {
        let validStreet = Guard.againstNil(argument: streetAddress)
        let validCountry = Guard.againstNil(argument: country)
        if !validStreet || !validCountry {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(BillingAddress(streetAddress: streetAddress, city: city, zipOrPostalCode: zipOrPostalCode, country: country))
    }
    
    var streetAddress: StreetAddress {
        return self._streetAddress
    }
    
    var city: City {
        return self._city
    }
    
    var zipOrPostalCode: ZipOrPostalCode {
        return self._zipOrPostalCode
    }
    
    var country: Country {
        return self._country
    }
}
