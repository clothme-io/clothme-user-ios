//
//  AcceptMeasurementDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct AcceptMeasurementDTO : RequestDataAble {
    let userId: String
    let sendingUserId: String
    let measurementType: String
    let date: String
    let choice: Bool = true
}
