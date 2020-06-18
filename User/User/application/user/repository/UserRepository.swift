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
    func getUserById<T: RequestDataAble>(data: T, completion: @escaping (_ user: User, _ error: String?) -> ())
    func getUserByName<T: RequestDataAble>(data: T, completion: @escaping (_ user: User, _ error: String?) -> ())
    func blockUser<T: RequestDataAble>(data: T, completion: @escaping (_ user: Void, _ error: String?) -> ())
    
}
