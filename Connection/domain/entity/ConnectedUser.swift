//
//  ConnectedUser.swift
//  Connection
//
//  Created by MACPRO on 2020-04-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

class ConnectedUser: Equatable {
    
    private let userId: ConnectedUserId
    private var FirstName: ConnectedUserFirstName
    private var LastName: ConnectedUserLastName
    private var city: ConnectedUserCity
    
    private init(
        anId: ConnectedUserId,
        aFirstName: ConnectedUserFirstName,
        aLastName: ConnectedUserLastName,
        aCity: ConnectedUserCity
    ) {
        self.userId = anId
        self.FirstName = aFirstName
        self.LastName = aLastName
        self.city = aCity
    }
    
    public static func Create () {}
    
    static func == (lhs: ConnectedUser, rhs: ConnectedUser) -> Bool {
        return lhs.userId === rhs.userId
    }
}
