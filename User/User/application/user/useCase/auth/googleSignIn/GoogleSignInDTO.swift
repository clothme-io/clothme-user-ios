//
//  GoogleSignInDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public struct GoogleSignInDTO : RequestDataAble {
    var token: String
    var dateOfBirth: String
    let measurement: FullBodyMeasurementDTO
}
