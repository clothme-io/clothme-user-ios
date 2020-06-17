//
//  ConnectedUser.swift
//  Connection
//
//  Created by MACPRO on 2020-04-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


class ConnectedUser : Entity {
    
    private let connectedUserId: ConnectedUserId
    private var firstName: ConnectedUserFirstName
    private var lastName: ConnectedUserLastName
    private var city: ConnectedUserCity
//    private var measurement: [String?]
//    private var connectedUserBrands: [String?]
//    private var fitProducts: [String?]
    
    private init(
        id: String?,
        firstName: ConnectedUserFirstName,
        lastName: ConnectedUserLastName,
        city: ConnectedUserCity
    ) {
        self.connectedUserId = ConnectedUserId(_id: id)
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
        super.init(_id: self.connectedUserId.toString())
    }
    
    public static func Create () {}
    
    
}



