//
//  RemoveConnectionDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct RemoveConnectionDTO : RequestDataAble {
    let connectionId: String
    let userId: String
    let date: String
}
