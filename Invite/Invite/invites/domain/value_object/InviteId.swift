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
    
    override init(_id: Guid?) {
          super.init(_id: _id)
      }
      
      static func create(id: Guid?) -> ResultOption<InviteId, AppError> {
          return .ok(InviteId(_id: id ?? Guid(value: nil)))
      }
      
      func value() -> Guid {
          return self.eId
      }
    
}
