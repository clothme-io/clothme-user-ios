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
    
    public func execute(with data: GoogleSignInDTO) -> Future<User, GoogleSignInError> {
        
        return Future { promise in
            //MARK: CHECK AND VALIDATE DATA
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
            let age = Age.create(dateOfBirth: dateFormatter.date(from: data.dateOfBirth) ?? Date())
            let dob = age.getValue(result: age).year
            if let dob2 = dob {
                if dob2 < 16 {
                    return promise(.failure(GoogleSignInError.youNeedToBeOlder))
                }
            }
//            self._authRepo.googleSignIn(with: data) { result in
//                switch result {
//                case .failure(let err):
//                    return promise(.failure(GoogleSignInError.unKnown(err)))
//                case .success(let response):
//                    return promise(.success(response))
//                }
//            }
          
        }
        
    }
    
}
