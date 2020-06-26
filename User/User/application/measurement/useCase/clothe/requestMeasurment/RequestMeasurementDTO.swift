//
//  RequestMeasurmentDTO.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct RequestMeasurementDTO : RequestDataAble, MeasurementDataAble {
    private let measurementType: String
    private let requestingUserId: String
    private let userId: String
    private let requestedDate: String
}

