//
//  GetUserMeasurmentResponse.swift
//  User
//
//  Created by MACPRO on 2020-05-26.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct GetUserMeasurmentResponse : ResponseDataAble {
    let user: String
    let measurement: MeasurementData
}
