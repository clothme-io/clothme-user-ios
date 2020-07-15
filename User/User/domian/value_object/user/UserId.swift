//
//  UserId.swift
//  User
//
//  Created by MACPRO on 2020-03-25.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class UserId : Entity {
    
    override init(_id: Guid?) {
          super.init(_id: _id)
      }
      
      static func create(id: Guid?) -> ResultOption<UserId, AppError> {
          return .ok(UserId(_id: id ?? Guid(value: nil)))
      }
      
      func value() -> Guid {
          return self.eId
      }
}
