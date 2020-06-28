//
//  ConnectionId.swift
//  User
//
//  Created by MACPRO on 2020-04-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class ConnectionId : Entity {
    
    override init(_id: Guid?) {
        super.init(_id: _id)
    }
    
    static func create(id: Guid?) -> ResultOption<ConnectionId, ValidationError> {
        return .ok(ConnectionId(_id: id ?? Guid(value: nil)))
    }
    
    func value() -> Guid {
        return self.eId
    }
}
