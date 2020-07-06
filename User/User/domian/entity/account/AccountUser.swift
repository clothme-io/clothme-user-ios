//
//  UserAccount.swift
//  User
//
//  Created by MACPRO on 2020-04-18.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


class AccountUser : Entity {
    private let _accountId: AccountId
    private let _id: UserId
    private var _firstName: FirstName
    private var _lastName: LastName
    private var _dateOfBirth: DateOfBirth
    private var _gender: Gender
    private var _phoneNumber: PhoneNumber
    private var _relationship: RelationShip
    private var _dateAdded: DateAdded
    private var _shippingAddress: ShippingAddress?
    private var _brandId: String?
    
    private init(
        id: UserId,
        firstName: FirstName,
        lastName: LastName,
        dateOfBirth: DateOfBirth,
        gender: Gender,
        phoneNumber: PhoneNumber,
        relationShip: RelationShip,
        dataAdded: DateAdded
    ) {
        self._id = id
        self._firstName = firstName
        self._lastName = lastName
        self._dateOfBirth = dateOfBirth
        self._gender = gender
        self._phoneNumber = phoneNumber
        self._relationship = relationShip
        self._dateAdded = dataAdded
        let accountId = AccountId.create(id: Guid(value: nil))
        self._accountId = accountId.getValue(result: accountId)
        super.init(_id: Guid(value: self._accountId.value().toString()))
    }
    
    public static func create(
        id: UserId, firstName: FirstName, lastName: LastName, dateOfBirth: DateOfBirth,
        gender: Gender, phoneNumber: PhoneNumber, relationShip: RelationShip, dataAdded: DateAdded
    ) -> ResultOption<AccountUser, ValidationError> {
        return .ok(AccountUser(id: id, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, gender: gender, phoneNumber: phoneNumber, relationShip: relationShip, dataAdded: dataAdded))
    }
    
    var accountId : AccountId {
        return self._accountId
    }
    
    var Id: UserId {
        return self._id
    }
    
    var firstName: FirstName {
        return self._firstName
    }
    
    var lastName: LastName {
        return self._lastName
    }
    
    var dateOfBirth: DateOfBirth {
        return self._dateOfBirth
    }
    
    var gender: Gender {
        return self._gender
    }
    
    var phoneNumber: PhoneNumber {
        return self._phoneNumber
    }
    
    var relationShip: RelationShip {
        return self._relationship
    }
    
    var dataAdded: DateAdded {
        return self._dateAdded
    }
    
    var shippingAddress: ShippingAddress? {
        return self._shippingAddress
    }
    
    var brandId: String? {
        return self._brandId
    }
}


