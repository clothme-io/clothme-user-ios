//
//  ForgotPassword.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core



struct ForgotPassword : UseCaseAble {
    
    var _userRepo: UserRepository
    var _authRepo: AuthRepository
    
    init(userRepo: UserRepository, authRepo: AuthRepository) {
        self._userRepo = userRepo
        self._authRepo = authRepo
    }
    
    public func execute(with data: ForgotPasswordDTO) {}
}
