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
    
    public func execute(with data: EmailSignUpDTO) -> Future<Void, EmailSignUpError> {
        return Future { promise in
            
            // MARK: VALIDATE INPUT
            let firstName = FirstName.create(name: data.firstName)
            if !firstName.isSuccess(result: firstName) {
                return promise(.failure(EmailSignUpError.unKnown(firstName as! Error)))
            }
            
            let gender = Gender.create(gender: data.gender)
            let genderOrError = gender.OptionalValue(result: gender)
            if let genderError = genderOrError.error {
                return promise(.failure(EmailSignUpError.unKnown(genderError)))
            }
            
            let email = UserEmail.create(value: data.email)
            let emailOrError = email.OptionalValue(result: email)
            if let emailError = emailOrError.error {
                return promise(.failure(EmailSignUpError.unKnown(emailError)))
            }
            
            let city = City.create(city: data.city)
            let cityOrError = city.OptionalValue(result: city)
            if let cityError = cityOrError.error {
                return promise(.failure(EmailSignUpError.unKnown(cityError)))
            }
            
            let password = Password.create(with: data.password)
            let passwordOrError = password.OptionalValue(result: password)
            if let passwordError = passwordOrError.error {
                return promise(.failure(EmailSignUpError.unKnown(passwordError)))
            }
            
            // MARK: MAKE NETWORK CALL
//            self._authRepo.emailSignUp(with: data) { result in
//                switch result {
//                case .failure(let error):
//                    return promise(.failure(EmailSignUpError.unKnown(error)))
//                case .success(_):
//                    break
//                }
//            }
        }
        
    }
    
}
