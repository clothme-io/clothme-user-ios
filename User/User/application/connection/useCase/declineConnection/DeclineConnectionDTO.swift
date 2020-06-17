//
//  DeclineConnectionDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct DeclineAcceptDTO : RequestDataAble {
    let declingUserId: String
    let sendingUserId: String
    let connectionid: String
    let date: String
}
