//
//  AuthRepository.swift
//  User
//
//  Created by MACPRO on 2020-04-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core
import Combine

protocol AuthRepository : IRepositoryWithTypedId {
    func emailSignIn <T: RequestDataAble>(with data: T, completion: @escaping (Result<User, EmailSignInError>) -> Void)
    func emailSignUp <T: RequestDataAble>(with data: T, completion: @escaping (Result<User, EmailSignInError>) -> Void)
    func facebookSignIn <T: RequestDataAble>(with data: T, completion: @escaping (Result<User, EmailSignInError>) -> Void)
    func googleSignIn<T: RequestDataAble>(with data: T, completion: @escaping (Result<User, EmailSignInError>) -> Void)
    func signOut()
    func resetPassword<T: RequestDataAble>(with data: T, completion: @escaping (Result<User, EmailSignInError>) -> Void)
    func forgotPassword<T: RequestDataAble>(with data: T, completion: @escaping (Result<Void, EmailSignInError>) -> Void)
}
