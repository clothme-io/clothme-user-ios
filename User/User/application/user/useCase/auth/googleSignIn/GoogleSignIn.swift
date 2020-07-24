//
//  GoogleSignInUseCase.swift
//  User
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core

public struct GoogleSignIn : UseCaseAble {
    
    var _authRepo: AuthRepository
    
    init(authRepo: AuthRepository) {
        self._authRepo = authRepo
    }
    
    public func execute(with data: GoogleSignInDTO) -> Future<UserApplicationModel, AppError> {
        return Future { promise in
            //MARK: CHECK AND VALIDATE DATA
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
            let age = Age.create(with: data.dateOfBirth).OptionalData().value?.year
            let dob = age
            if let dobValue = dob {
                if dobValue < 16 {
                    return promise(.failure(AppError.youNeedToBeOlder))
                }
            }
            self._authRepo.googleSignIn(with: data) { result, error in
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
