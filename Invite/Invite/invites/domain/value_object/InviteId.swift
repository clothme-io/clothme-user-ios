//
//  InviteId.swift
//  Invite
//
//  Created by MACPRO on 2020-04-05.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class InviteId : Entity {
    
    private let id: String?
    
    override init(_id: String?) {
        self.id = _id
        super.init(_id: self.id)
    }
    
}
