//
//  CreateAccountDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct CreateAccountDTO : RequestDataAble, MeasurementDataAble {
    let accountId: String
    let user: String
}
