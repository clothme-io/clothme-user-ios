//
//  SignOutUseCase.swift
//  User
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct SignOut : UseCaseAble {
    
    var _userRepo: UserRepository
    var _authRepo: AuthRepository
    
    init(userRepo: UserRepository, authRepo: AuthRepository) {
        self._userRepo = userRepo
        self._authRepo = authRepo
    }
    
    public func execute(with data: SignOutDTO) {}
    
}
