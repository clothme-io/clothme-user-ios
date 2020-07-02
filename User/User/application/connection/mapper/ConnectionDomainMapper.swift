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
        let index = 0
        let connectionUsers: [ConnectionUserData] = [ConnectionUserData]()
        while connection.connectedUsers.count < index {
            let users = ConnectionUserData(userId: connection.connectedUsers[index].eId.toString(), firstName: connection.connectedUsers[index], lastName: <#T##String#>, city: <#T##String#>, connectionDate: <#T##String#>, connectionDuration: <#T##Int#>)
        }
        
        return ConnectionApplicationModel
    }
}
