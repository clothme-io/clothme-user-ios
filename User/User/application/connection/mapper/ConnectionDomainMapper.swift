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
        return ConnectionApplicationModel(connectedUser: userList(connection), numberOfConnection: connection.numberOfConnection.value)
    }
    
    private static func userList(_ connection: Connection) -> [ConnectionUserApplicationModel] {
        var index = 0
        var connectionUsers: [ConnectionUserApplicationModel] = [ConnectionUserApplicationModel]()
        while connection.connectedUsers.count <= index {
            let users = ConnectionUserApplicationModel(connectionId: connection.connectedUsers[index].connectionId.value().toIdString(), userId:  connection.connectedUsers[index].userId.eId.toIdString(), firstName: connection.connectedUsers[index].firstName.value, lastName: connection.connectedUsers[index].lastName.value, city: connection.connectedUsers[index].city.value, connectionDate: connection.connectedUsers[index].connectionDate.date, connectionDuration: connection.connectedUsers[index].connectionDuration.value)
            connectionUsers.append(users)
            index += 1
        }
        return connectionUsers
    }
    
//    static func toDomainModel(connectionApplicationModel: ConnectionApplicationModel) -> Connection {
//        
//    }
}
