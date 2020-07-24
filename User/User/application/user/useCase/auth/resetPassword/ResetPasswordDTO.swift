//
//  ResetPasswordDTO.swift
//  User
//
//  Created by MACPRO on 2020-04-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct ResetPasswordDTO : RequestDataAble {
    let email: String
    let userId: String
    let currentPassword: String
}
