//
//  ForgotPassword.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core
import Combine

struct ForgotPassword : UseCaseAble {
    
    var _authRepo: AuthRepository
    
    init(authRepo: AuthRepository) {
        self._authRepo = authRepo
    }
    
    public func execute(with data: ForgotPasswordDTO) -> Future<Void, AppError> {
        return Future { promise in
            let emailOrError = UserEmail.create(with: data.email).isSuccess()
            if !emailOrError {
                return promise(.failure(AppError.emailMustBeProvided))
            }
            
            self._authRepo.forgotPassword(with: data) { (result, error) in
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
