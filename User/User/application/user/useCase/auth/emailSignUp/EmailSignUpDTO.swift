//
//  EmailSignUpDTO.swift
//  User
//
//  Created by MACPRO on 2020-04-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public struct EmailSignUpDTO : RequestDataAble {
    let firstName: String
    let gender: String
    let dateOfBith: String
    let city: String
    let email: String
    let password: String
    let measurement: FullBodyMeasurementDTO
}
