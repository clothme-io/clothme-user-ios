//
//  AccountId.swift
//  User
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


class AccountId : Entity {
    
    override init(_id: Guid?) {
        super.init(_id: _id)
    }
      
    static func create(id: Guid?) -> ResultOption<AccountId, AppError> {
        return .ok(AccountId(_id: id ?? Guid(value: nil)))
    }
      
    func value() -> Guid {
        return self.eId
    }
}
