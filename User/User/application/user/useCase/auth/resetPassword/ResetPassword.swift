//
//  ResetPassword.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core
import Combine

struct ResetPassword : UseCaseAble {
    
    var _authRepo: AuthRepository
    
    init(authRepo: AuthRepository) {
        self._authRepo = authRepo
    }
    
    public func execute(with data: ResetPasswordDTO) -> Future<UserApplicationModel, AppError> {
        return Future { promise in
            self._authRepo.resetPassword(with: data) { (result, error) in
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
