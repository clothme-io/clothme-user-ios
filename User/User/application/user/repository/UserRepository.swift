//
//  ProfileRepository.swift
//  User
//
//  Created by MACPRO on 2020-04-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


protocol UserRepository : IRepositoryWithTypedId {
    func getUserById<T: RequestDataAble>(data: T, completion: @escaping (Result<User, EmailSignInError>) -> Void)
    func getUserByName<T: RequestDataAble>(data: T, completion: @escaping (Result<User, EmailSignInError>) -> Void) -> Result<[User], UserError>
}
