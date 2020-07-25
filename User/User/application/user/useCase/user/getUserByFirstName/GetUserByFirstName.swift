//
//  GetUserByName.swift
//  User
//
//  Created by MACPRO on 2020-07-24.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core


struct GetUserByFirstName : UseCaseAble {
    
    var _userRepo: UserRepository
    
    init(userRepo: UserRepository) {
        self._userRepo = userRepo
    }
    
    public func execute(with data: GetUserByFirstNameDTO) -> Future<UserApplicationModel, AppError> {
        return Future { promise in
            let userIdOrError = UserId.create(id: Guid(value: data.userId)).isSuccess()
            if !userIdOrError {
                return promise(.failure(AppError.userIdMustBeProvided))
            }
            
            let firstNameOrError = FirstName.create(with: data.firstName).isSuccess()
            if !firstNameOrError {
                return promise(.failure(AppError.firstNameCannotBeEmpty))
            }
            
            self._userRepo.getUserByName(data: data) { (result, error) in
                if let error = error {
                    return promise(.failure(AppError.unknown(cause: error as! Error)))
                } else {
                    if let result = result {
                        return promise(.success(UserMapper.toDataModel(user: result)))
                    }
                }
            }
        }
    }
    
}
