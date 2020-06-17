//
//  ConnectedUserId.swift
//  Connection
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import User


class ConnectedUserId: Equatable {
    
    private let _id: String
    
    private init(id: String) {
        self._id = id
    }
    
    public static func Create () {
//        var user = User.Create()
    }
    
    static func == (lhs: ConnectedUserId, rhs: ConnectedUserId) -> Bool {
        return lhs._id as AnyObject === rhs._id as AnyObject
    }
    
    
}
