//
//  SignOutUseCase.swift
//  User
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core
import Combine

struct SignOut : UseCaseAble {
    
    private var _authRepo: AuthRepository
    
    init(authRepo: AuthRepository) {
        self._authRepo = authRepo
    }
    
    public func execute(with data: SignOutDTO) -> Future<Void, AppError> {
        return Future { promise in
            let userIdOrError = UserId.create(id: Guid(value: data.userId)).isSuccess()
            if !userIdOrError {
                return promise(.failure(AppError.userIdMustBeProvided))
            }
            self._authRepo.signOut(with: data, completion: { result, error in
                if let error = error {
                    promise(.failure(AppError.unknown(cause: error as! Error)))
                } else {
                    if let result = result {
                        promise(.success(result))
                    }
                }
            })
        }
    }
    
}
