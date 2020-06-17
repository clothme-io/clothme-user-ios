//
//  GetUserUseCase.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core


struct GetUser : UseCaseAble {
    
    var _userRepo: UserRepository
    
    init(userRepo: UserRepository) {
        self._userRepo = userRepo
    }
    
    public func execute(with data: GetUserDTO) -> Future<User, GetUserError> {
        return Future { promise in
            
            
        }
    }
    
}
