//
//  RequestConnectionDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct SendConnectionDTO : RequestDataAble {
    let sendingUserId: String
    let recevingUserId: String
    let connectionDate: String
    let date: String
}
