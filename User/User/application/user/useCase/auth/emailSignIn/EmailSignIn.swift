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
    
    public func execute(with data: EmailSignInDTO) -> Future<User, EmailSignInError> {
        return Future { promise in
            
            //MARK: Check for Valid Data on data
            let email = UserEmail.create(value: data.email)
            let emailOrError = email.OptionalValue(result: email)
            if let emailError = emailOrError.error {
                return promise(.failure(EmailSignInError.unKnown(emailError)))
            }
            
            let password = Password.create(with: data.password)
            let passwordOrError = password.OptionalValue(result: password)
            if let passwordError = passwordOrError.error {
                return promise(.failure(EmailSignInError.unKnown(passwordError)))
            }
            
            //MARK: NETWORK CALL
            self._authRepo.emailSignIn(with: data) { result in
                switch result {
                case .failure(let err):
                    return promise(.failure(EmailSignInError.unKnown(err)))
                case .success(let response):
                    return promise(.success(response))
                }
                
            }
            
        }
    }
    
}
