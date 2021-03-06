//
//  ConnectionData.swift
//  User
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct ConnectionApplicationModel : ResponseDataAble {
    let connectedUser: [ConnectionUserApplicationModel]
    let numberOfConnection: Int
}


struct ConnectionUserApplicationModel : ResponseDataAble {
    let connectionId: String
    let userId: String
    let firstName: String
    let lastName: String
    let city: String
    let connectionDate: String
    let connectionDuration: Int
}
