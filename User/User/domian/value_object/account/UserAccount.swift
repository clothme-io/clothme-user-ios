//
//  UserAccount.swift
//  User
//
//  Created by MACPRO on 2020-04-18.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


class UserAccount : Entity {
    
    private let userAccountId: UserAccountId
    private var _user: User
    private var _relationship: RelationShip
    private var _dateAdded: String
    
    private init(_id: String?, user: User, relationShip: RelationShip, dataAdded: String) {
        self.userAccountId = UserAccountId(_id: _id)
        self._user = user
        self._relationship = relationShip
        self._dateAdded = dataAdded
        super.init(_id: self.userAccountId.toString())
    }
    
    public static func create(id: String, user: User, relationShip: RelationShip, dataAdded: String) -> ResultOption<UserAccount, ValidationError> {
        return .ok(UserAccount(_id: id, user: user, relationShip: relationShip, dataAdded: dataAdded))
    }
    
    var users : User {
        return self._user
    }
    
    public func remove(userId: UserId, users: [User]) {
        
    }
}



// MARK: Validation
extension UserAccount {
    
}
