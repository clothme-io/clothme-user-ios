//
//  RemoveUser.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core

struct RemoveUser : UseCaseAble {
    
    var _userRepo: UserRepository
    
    init(userRepo: UserRepository) {
        self._userRepo = userRepo
    }
    
    public func execute(with data: RemoveUserDTO) -> Future<Void, RemoveUserError> {
        return Future { promise in
            
        }
    }
    
}
