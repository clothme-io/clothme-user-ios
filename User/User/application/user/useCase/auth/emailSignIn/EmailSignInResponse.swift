//
//  EmailSignInResponse.swift
//  User
//
//  Created by MACPRO on 2020-05-16.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct EmailSignInResponse : ResponseDataAble {
    let userId: String
    let firstName: String
    let email: String
    let city: String
    let measurement: FullBodyMeasurementDTO
    let preferences: String
}
