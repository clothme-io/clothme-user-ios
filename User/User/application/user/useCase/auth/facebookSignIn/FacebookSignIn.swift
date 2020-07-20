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
    
    public func execute(with data: FacebookSignInDTO) -> Future<ResponseDataAble, FacebookSignInError> {
        return Future { promise in
            // MARK: VALIDATE INPUT
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
            let age = Age.create(dateOfBirth: data.dateOfBirth)
            if let ageError = age.OptionalValue(result: age).error {
                return promise(.failure(FacebookSignInError.unKnown(ageError)))
            }
            
            if let ageValue = age.OptionalValue(result: age).optionalData?.year {
                if ageValue < 16 {
                    return promise(.failure(FacebookSignInError.youNeedToBeOlder))
                }
            }
            
            //MARK: MAKE NETWORK CALL
//            self._authRepo.facebookSignIn(with: data, completion: { result in
//                switch result {
//                case .failure(let error):
//                    return promise(.failure(FacebookSignInError.unKnown(error)))
//                case .success(let user):
//                    return promise(.success(user as! ResponseDataAble))
//                }
//            })
        }
    }
}
