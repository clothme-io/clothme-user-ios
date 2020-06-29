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
    private var _streetNumber: Int?;
    private var _streetName: String?;
    
    private init(_ number: Int, _ name: String) {
        self._streetNumber = number;
        self._streetName = name;
    }
    
    private init(streetNumber number: Int) {
        self._streetNumber = number;
    }
    
    private init(streetName name: String) {
        self._streetName = name;
    }
    
    init() {
        self._streetNumber = nil
        self._streetName = ""
    }
    
    public static func create (streetNumber number: Int, streetName name: String) -> ResultOption<StreetAddress, ValidationError> {
        return validateForNilValue(number: number, name: name)
                .bind(validateForEmptyValue)
                .bind(initStreetAddress)
    }
    
    public func changeNumber (with newValue: Int, oldValue: StreetAddress) -> ResultOption<StreetAddress, ValidationError> {
        if newValue == oldValue._streetNumber {
            return .error(ValidationError.sameValueNotAllowed)
        }
        return StreetAddress.validateForEmptyValue(number: newValue, name: oldValue._streetName!)
            .bind(StreetAddress.validateForNilValue)
            .bind(StreetAddress.initStreetAddress)
    }

    public func changeName (with oldValue: StreetAddress, newValue: String) -> ResultOption<StreetAddress, ValidationError> {
        if oldValue._streetName == newValue {
            return .error(ValidationError.sameValueNotAllowed)
        }
        return StreetAddress.validateForEmptyValue(number: oldValue._streetNumber!, name: newValue)
            .bind(StreetAddress.validateForNilValue)
            .bind(StreetAddress.initStreetAddress)
    }
    
    
    var number: Int? {
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
    private static func validateForEmptyValue (number: Int, name: String) -> ResultOption<(Int, String), ValidationError> {
        let validNumber = Guard.againstNegative(value: Double(Int(number)))
        let validName = Guard.AgainstEmptyString(argument: name)
        if validName && validNumber {
            return .ok((number, name))
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func validateForNilValue (number: Int, name: String) -> ResultOption<(Int, String), ValidationError> {
        let validNumber = Guard.againstNil(argument: number)
        let validName = Guard.AgainstNilString(argument: name)
        if validName && validNumber {
             return .ok((number, name))
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func initStreetAddress(_ number: Int, _ name: String) -> ResultOption<StreetAddress, ValidationError> {
        if name.isEmpty && number < 0 {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        return .ok(StreetAddress(number, name))
    }
}
