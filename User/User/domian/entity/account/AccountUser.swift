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
    
    private let id: UserId
    private var _firstName: FirstName
    private var _lastName: LastName
    private var _dateOfBirth: DateOfBirth
    private var _gender: Gender
    private var _phoneNumber: PhoneNumber
    private var _shippingAddress: ShippingAddress
    private var _relationship: RelationShip
    private var _dateAdded: DateAdded
    
    private init(_id: String?, user: User, relationShip: RelationShip, dataAdded: DateAdded) {
        self._relationship = relationShip
        self._dateAdded = dataAdded
        super.init(_id: nil)
    }
    
    public static func create(id: String, user: User, relationShip: RelationShip, dataAdded: String) -> ResultOption<AccountUser, ValidationError> {
        return .ok()
    }
    
    public func remove(userId: UserId, users: [User]) {
        
    }
}



// MARK: Validation
extension AccountUser {
    
}
