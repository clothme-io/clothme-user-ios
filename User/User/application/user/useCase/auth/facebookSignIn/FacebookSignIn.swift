//
//  FacebookSignIn.swift
//  User
//
//  Created by MACPRO on 2020-04-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core


public class FacebookSignIn : UseCaseAble {
    
    var _authRepo: AuthRepository
    
    init(authRepo: AuthRepository) {
        self._authRepo = authRepo
    }
    
    public func execute(with data: FacebookSignInDTO) -> Future<UserApplicationModel, AppError> {
        return Future { promise in
            // MARK: VALIDATE INPUT
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
            let ageOrError = Age.create(with: data.dateOfBirth).OptionalData()
            if ((ageOrError.error) != nil) {
                return promise(.failure(AppError.dateOfBirthCannotBeEmpty))
            }
            
            if let ageValue = ageOrError.value?.year {
                if ageValue < 16 {
                    return promise(.failure(AppError.ageTooYoung))
                }
            }
            
            //MARK: MAKE NETWORK CALL
            self._authRepo.facebookSignIn(with: data, completion: { result, error in
                if let error = error {
                    promise(.failure(AppError.unknown(cause: error as! Error)))
                } else {
                    if let result = result {
                        promise(.success(UserMapper.toDataModel(user: result)))
                    }
                }
            })
        }
    }
}
