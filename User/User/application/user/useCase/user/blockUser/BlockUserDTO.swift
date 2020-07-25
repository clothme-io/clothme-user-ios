//
//  BlockUserDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct BlockUserDTO : RequestDataAble {
    let userId: String
    let userIdToBlock: String
    let date: String
}
