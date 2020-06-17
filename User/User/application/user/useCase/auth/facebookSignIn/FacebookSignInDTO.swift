//
//  FacebookSignInDTO.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public struct FacebookSignInDTO : RequestDataAble {
    let token: String
    let dateOfBirth: String
    let measurement: FullBodyMeasurementDTO
}
