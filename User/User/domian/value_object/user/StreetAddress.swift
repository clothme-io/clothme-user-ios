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
    private var _streetNumber: String?;
    private var _streetName: String?;
    
    private init(_ number: String, _ name: String) {
        self._streetNumber = number;
        self._streetName = name;
    }
    
    private init(streetNumber number: String) {
        self._streetNumber = number;
    }
    
    private init(streetName name: String) {
        self._streetName = name;
    }
    
    init() {
        self._streetNumber = nil
        self._streetName = ""
    }
    
    public static func create (streetNumber number: String, streetName name: String) -> ResultOption<StreetAddress, AppError> {
        return validateForNilValue(number: number, name: name)
                .bind(validateForEmptyValue)
                .bind(initStreetAddress)
    }
    
    public func changeNumber (with newValue: String, oldValue: StreetAddress) -> ResultOption<StreetAddress, AppError> {
        if newValue == oldValue._streetNumber {
            return .error(AppError.sameValueNotAllowed)
        }
        return StreetAddress.validateForEmptyValue(number: newValue, name: oldValue._streetName!)
            .bind(StreetAddress.validateForNilValue)
            .bind(StreetAddress.initStreetAddress)
    }

    public func changeName (with oldValue: StreetAddress, newValue: String) -> ResultOption<StreetAddress, AppError> {
        if oldValue._streetName == newValue {
            return .error(AppError.sameValueNotAllowed)
        }
        return StreetAddress.validateForEmptyValue(number: oldValue._streetNumber!, name: newValue)
            .bind(StreetAddress.validateForNilValue)
            .bind(StreetAddress.initStreetAddress)
    }
    
    
    var number: String? {
        get {
            return self._streetNumber
        }
    }

    var name: String? {
        get {
            return self._streetName
        }
    }
}



// MARK: Validation
extension StreetAddress {
    private static func validateForEmptyValue (number: String, name: String) -> ResultOption<(String, String), AppError> {
        let validNumber = Guard.AgainstEmptyString(argument: number)
        let validName = Guard.AgainstEmptyString(argument: name)
        if validName && validNumber {
            return .ok((number, name))
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateForNilValue (number: String, name: String) -> ResultOption<(String, String), AppError> {
        let validNumber = Guard.AgainstNilString(argument: number)
        let validName = Guard.AgainstNilString(argument: name)
        if validName && validNumber {
             return .ok((number, name))
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func initStreetAddress(_ number: String, _ name: String) -> ResultOption<StreetAddress, AppError> {
        if name.isEmpty && number.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(StreetAddress(number, name))
    }
}
