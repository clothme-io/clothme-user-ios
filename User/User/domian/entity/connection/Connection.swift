//
//  Connection.swift
//  User
//
//  Created by MACPRO on 2020-04-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class Connection : Entity {
    
    private let userId: UserId
    private static var _allowedConnection = AllowedConnection.get()
    private var _numberOfConnection: NumberOfConnection
    private var _connectedUsers = [ConnectedUser]()
    
    private init(
        userId: UserId,
        numberOfConnection: NumberOfConnection
        ) {
        self.userId = userId
        self._numberOfConnection = numberOfConnection
        super.init(_id: Guid(value: userId.eId.toString()))
    }
    
    static func create(
        userId: UserId,
        numberOfConnection: NumberOfConnection) -> ResultOption<Connection, ValidationError> {
        
        return .ok(Connection(userId: userId, numberOfConnection: numberOfConnection))
    }
    
    func addFor (_ data: ConnectedUser) {
        _connectedUsers.append(data)
    }
    
    var connectionId : ConnectionId {
        return ConnectionId(_id: nil)
    }
}

