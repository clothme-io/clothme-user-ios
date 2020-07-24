//
//  EmailSignUpUseCase.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core
import Combine


class EmailSignUp : UseCaseAble {
    
    private var _authRepo: AuthRepository
    
    init(authRepo: AuthRepository) {
        self._authRepo = authRepo
    }
    
    public func execute(with data: EmailSignUpDTO) -> Future<Void, AppError> {
        return Future { promise in
            
            // MARK: VALIDATE INPUT
            let firstNameOrError = FirstName.create(with: data.firstName).isSuccess()
            if !firstNameOrError {
                return promise(.failure(AppError.firstNameCannotBeEmpty))
            }
            
            let genderOrError = Gender.create(gender: data.gender).isSuccess()
            if !genderOrError {
                return promise(.failure(AppError.genderCannotBeEmpty))
            }
            
            let emailOrError = UserEmail.create(with: data.email).isSuccess()
            if !emailOrError {
                return promise(.failure(AppError.emailMustBeProvided))
            }
            
            let cityOrError = City.create(withCity: data.city).isSuccess()
            if !cityOrError {
                return promise(.failure(AppError.cityCannotBeEmpty))
            }
            
            let passwordOrError = Password.create(with: data.password).isSuccess()
            if !passwordOrError {
                return promise(.failure(AppError.passwordMustBeProvided))
            }
            
            // MARK: MAKE NETWORK CALL
            self._authRepo.emailSignUp(with: data) { result, error  in
                if let error = error {
                    promise(.failure(.unknown(cause: error as! Error)))
                } else {
                    if let result = result {
                        promise(.success(result))
                    }
                }
            }
        }
        
    }
    
}
