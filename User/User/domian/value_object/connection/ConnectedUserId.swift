//
//  ConnectedUserId.swift
//  Connection
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


class ConnectedUserId : Entity {
    
    private let id: String
    
    override init(_id: String?) {
        self.id = _id ?? Guid(value: _id).toString()
        super.init(_id: self.id)
    }
    
    func toString () -> String {
        return self.id
    }
    
}



