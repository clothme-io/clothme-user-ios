//
//  Address.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct StreetAddress {
    private var _apartmentNumber: String?
    private var _streetNumber: String;
    private var _streetName: String;
    
    private init(apartmentNumber: String, number: String, name: String) {
        self._streetNumber = number;
        self._streetName = name;
    }
    
    public static func create (with apartmentNumber: String, with streetNumber: String, with streetName: String) -> ResultOption<StreetAddress, AppError> {
        if (!validateForNilValue(apartmentNumber: apartmentNumber, number: streetNumber, name: streetName)) {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(StreetAddress(apartmentNumber: apartmentNumber, number: streetNumber, name: streetName))
    }
    
//    public func changeNumber (with newValue: String, oldValue: StreetAddress) -> ResultOption<StreetAddress, AppError> {
//        if newValue == oldValue._streetNumber {
//            return .error(AppError.sameValueNotAllowed)
//        }
//        return StreetAddress.validateForEmptyValue(number: newValue, name: oldValue._streetName!)
//            .bind(StreetAddress.validateForNilValue)
//            .bind(StreetAddress.initStreetAddress)
//    }
//
//    public func changeName (with oldValue: StreetAddress, newValue: String) -> ResultOption<StreetAddress, AppError> {
//        if oldValue._streetName == newValue {
//            return .error(AppError.sameValueNotAllowed)
//        }
//        return StreetAddress.validateForEmptyValue(number: oldValue._streetNumber!, name: newValue)
//            .bind(StreetAddress.validateForNilValue)
//            .bind(StreetAddress.initStreetAddress)
//    }
    
    var apartment: String? {
        get {
            return self._apartmentNumber
        }
    }
    
    var number: String {
        get {
            return self._streetNumber
        }
    }

    var name: String {
        get {
            return self._streetName
        }
    }
}



// MARK: Validation
extension StreetAddress {
    private static func validateForNilValue(apartmentNumber: String, number: String, name: String) -> Bool {
        let validNumber = Guard.againstNilValue(argument: number)
        let validName = Guard.againstNilValue(argument: name)
        if !validName || !validNumber {
             return false
        }
        return true
    }
}
