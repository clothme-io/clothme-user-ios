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
    func emailSignIn <T: RequestDataAble>(with data: T, completion: @escaping (_ user: User?, _ error: String?) -> ())
    func emailSignUp <T: RequestDataAble>(with data: T, completion: @escaping (_ user: Void?, _ error: String?) -> ())
    func facebookSignIn <T: RequestDataAble>(with data: T, completion: @escaping (_ user: User?, _ error: String?) -> ())
    func googleSignIn<T: RequestDataAble>(with data: T, completion: @escaping (_ user: User?, _ error: String?) -> ())
    func signOut<T: RequestDataAble>(with data: T, completion: @escaping (_ user: Void?, _ error: String?) -> ())
    func resetPassword<T: RequestDataAble>(with data: T, completion: @escaping (_ user: User?, _ error: String?) -> ())
    func forgotPassword<T: RequestDataAble>(with data: T, completion: @escaping (_ user: Void?, _ error: String?) -> ())
}
