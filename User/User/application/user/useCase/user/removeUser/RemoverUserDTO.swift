//
//  RemoverUserDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct RemoveUserDTO : RequestDataAble {
    let userId: String
    let userToRemove: String
    let date: String
}
