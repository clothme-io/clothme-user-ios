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
    
    public func execute(with data: RemoveUserDTO) -> Future<Void, AppError> {
        return Future { promise in
            let userIdOrError = UserId.create(id: Guid(value: data.userId)).isSuccess()
            if !userIdOrError {
                return promise(.failure(AppError.userIdMustBeProvided))
            }
            
            let userIdToRemoveOrError = UserId.create(id: Guid(value: data.userIdToRemove)).isSuccess()
            if !userIdToRemoveOrError {
                return promise(.failure(AppError.userIdMustBeProvided))
            }
            
            self._userRepo.removeUser(data: data) { (result, error) in
                if let error = error {
                    return promise(.failure(AppError.unknown(cause: error as! Error)))
                } else {
                    if let result = result {
                        return promise(.success(result))
                    }
                }
            }
        }
    }
    
}
