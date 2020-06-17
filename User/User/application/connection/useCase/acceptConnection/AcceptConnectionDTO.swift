//
//  AcceptConnectionDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct AcceptConnectionDTO : RequestDataAble {
    let acceptingUserId: String
    let sendingUserId: String
    let connectionId: String
    let date: String
}


