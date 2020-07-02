//
//  ConnectionDataMap.swift
//  User
//
//  Created by MACPRO on 2020-05-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class ConnectionDomainMapper {
    
    static func toApplicationModel(connection: Connection) -> ConnectionApplicationModel {
        return ConnectionApplicationModel(connectedUser: userList(connection))
    }
    
    private static func userList(_ connection: Connection) -> [ConnectionUserData] {
        let index = 0
        var connectionUsers: [ConnectionUserData] = [ConnectionUserData]()
        while connection.connectedUsers.count < index {
            let users = ConnectionUserData(connectionId: connection.connectedUsers[index].connectionId.eId.toString(), userId:  connection.connectedUsers[index].userId.eId.toString(), firstName: connection.connectedUsers[index].firstName.value, lastName: connection.connectedUsers[index].lastName.value, city: connection.connectedUsers[index].city.value, connectionDate: connection.connectedUsers[index].connectionDate.date, connectionDuration: <#T##Int#>)
            connectionUsers.append(users)
        }
        return connectionUsers
    }
}
