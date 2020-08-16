//
//  LocationAddress.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct LocationAddress: Equatable {
    
    private var _streetNumber: String
    private var _streetName: String
    private var _city: String
    private var _country: String
    
    private init(
        streetNumber: String,
        streetName: String,
        city: String,
        country: String
    ) {
        self._streetNumber = streetNumber
        self._streetName = streetName
        self._city = city
        self._country = country
    }
    
    public static func create(
        streetNumber: String,
        streetName: String,
        city: String,
        country: String
    ) -> ResultOption<LocationAddress, AppError> {
        let validName = Guard.againstEmptyString(argument: streetName)
        if !validName {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(LocationAddress(
            streetNumber: streetNumber,
            streetName: streetName,
            city: city,
            country: country)
        )
    }
    
    public func streetNumber() -> String {
        return self._streetNumber
    }
    
    public func streetName() -> String {
        return self._streetName
    }
    
    public func city() -> String {
        return self._city
    }
    
    public func country() -> String {
        return self._country
    }
    
    
}
