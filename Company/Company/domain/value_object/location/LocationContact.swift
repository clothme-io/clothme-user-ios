//
//  LocationContact.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct LocationContact : Equatable {
    
    private var _email: String
    private var _phoneNumber: String
    
    private init(
        email: String,
        phoneNumber: String
    ) {
        self._email = email
        self._phoneNumber = phoneNumber
    }
    
    public static func create(
        email: String,
        phoneNumber: String
    ) -> ResultOption<LocationContact, AppError> {
        return .ok(LocationContact(
            email: email,
            phoneNumber: phoneNumber)
        )
    }
    
    public func email() -> String {
        return self._email
    }
    
    public func phoneNumber() -> String {
        return self._phoneNumber
    }
}
