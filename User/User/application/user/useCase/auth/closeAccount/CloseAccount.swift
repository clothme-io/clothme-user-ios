//
//  CloseAccount.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core
import Combine

struct CloseAccount : UseCaseAble {
    
    var _userRepo: UserRepository
    
    init(userRepo: UserRepository) {
        self._userRepo = userRepo
    }
    
    public func execute(with data: CloseAccountDTO) -> Future<Void, AppError> {
        return Future{ promise in
            let userIdOrError = UserId.create(id: Guid(value: data.userId)).isSuccess()
            if !userIdOrError {
                return promise(.failure(AppError.userIdMustBeProvided))
            }
            
            let passwordOrError = Password.create(with: data.password).isSuccess()
            if !passwordOrError {
                return promise(.failure(AppError.passwordMustBeProvided))
            }
            
            self._userRepo.closeAccount(data: data) { (result, error) in
                if let error = error {
                    promise(.failure(AppError.unknown(cause: error as! Error)))
                } else {
                    if let result = result {
                        promise(.success(result))
                    }
                }
            }
        }
    }
    
}
