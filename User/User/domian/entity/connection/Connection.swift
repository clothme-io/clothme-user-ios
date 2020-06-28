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
    private var _connectedUsers = [ConnectedUser]()
    
    private init(id: String?, date: ConnectionDate, duration: ConnectionDuration, user: ConnectedUser) {
        self.connectionDate = date
        self.connectionDuration = duration
        self.user = user
        self.id = ConnectionId(_id: id)
        super.init(_id: self.id.toString())
        self.addFor(self.user)
    }
    
    func addFor (_ data: ConnectedUser) {
        connectedUsers.append(data)
    }
    
    var connectionId : ConnectionId {
        return self.id
    }
    
    var date : String {
        self.connectionDate.value
    }
}

