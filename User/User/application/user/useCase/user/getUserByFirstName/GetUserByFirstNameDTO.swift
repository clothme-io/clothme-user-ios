//
//  GetUserByNameDTO.swift
//  User
//
//  Created by MACPRO on 2020-07-24.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct GetUserByFirstNameDTO: RequestDataAble {
    let userId: String
    let firstName: String
}
