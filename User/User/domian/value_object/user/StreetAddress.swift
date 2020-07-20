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
    
    private init(_ apartmentNumber: String, _ number: String, _ name: String) {
        self._streetNumber = number;
        self._streetName = name;
    }
    
    public static func create (apartmentNumber: String, streetNumber number: String, streetName name: String) -> ResultOption<StreetAddress, AppError> {
        return validateForNilValue(apartmentNumber: apartmentNumber, number: number, name: name)
                .bind(validateForEmptyValue)
                .bind(initStreetAddress)
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
    private static func validateForEmptyValue (apartmentNumber: String, number: String, name: String) -> ResultOption<(String, String, String), AppError> {
        let validNumber = Guard.AgainstEmptyString(argument: number)
        let validName = Guard.AgainstEmptyString(argument: name)
        if validName && validNumber {
            return .ok((apartmentNumber, number, name))
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateForNilValue (apartmentNumber: String, number: String, name: String) -> ResultOption<(String, String, String), AppError> {
        let validNumber = Guard.againstNilValue(argument: number)
        let validName = Guard.againstNilValue(argument: name)
        if validName && validNumber {
             return .ok((apartmentNumber, number, name))
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func initStreetAddress(_ apartmentNumber: String, _ number: String, _ name: String) -> ResultOption<StreetAddress, AppError> {
        if name.isEmpty && number.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(StreetAddress(apartmentNumber, number, name))
    }
}
