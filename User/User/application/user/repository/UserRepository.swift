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
    func getUserById<T: RequestDataAble>(data: T, completion: @escaping (_ user: User?, _ error: String?) -> ())
    func editUser<T: RequestDataAble>(data: T, completion: @escaping (_ void: User?, _ error: String?) -> ())
    func getUserByName<T: RequestDataAble>(data: T, completion: @escaping (_ user: User?, _ error: String?) -> ())
    func blockUser<T: RequestDataAble>(data: T, completion: @escaping (_ user: Void?, _ error: String?) -> ())
    func closeAccount<T: RequestDataAble>(data: T, completion: @escaping (_ void: Void?, _ error: String?) -> ())
    func removeUser<T: RequestDataAble>(data: T, completion: @escaping (_ void: Void?, _ error: String?) -> ())
}
