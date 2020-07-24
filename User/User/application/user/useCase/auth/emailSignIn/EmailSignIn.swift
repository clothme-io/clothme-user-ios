//
//  EmailSignInUseCase.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core


public class EmailSignIn {
    
    var _authRepo: AuthRepository
    
    init(authRepo: AuthRepository) {
        self._authRepo = authRepo
    }
    
    public func execute(with data: EmailSignInDTO) -> Future<UserApplicationModel, AppError> {
        return Future { promise in
            
            //MARK: Check for Valid Data on data
            let emailOrError = UserEmail.create(with: data.email).isSuccess()
            if !emailOrError {
                return promise(.failure(AppError.emailMustBeProvided))
            }
            
            let passwordOrError = Password.create(with: data.password).isSuccess()
            if !passwordOrError {
                return promise(.failure(AppError.passwordMustBeProvided))
            }
            
            //MARK: NETWORK CALL
            self._authRepo.emailSignIn(with: data) { result, error  in
                if let error = error {
                    promise(.failure(AppError.unknown(cause: error as! Error)))
                } else {
                    if let result = result {
                        promise(.success(UserMapper.toDataModel(user: result)))
                    }
                }
            }
        }
    }
    
}
