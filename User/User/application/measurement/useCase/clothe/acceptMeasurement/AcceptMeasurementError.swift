//
//  AcceptMeasurementError.swift
//  User
//
//  Created by MACPRO on 2020-05-16.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

enum AcceptMeasurementError : String, Error {
    case measurementAlreadyAccepted
    case mustBeConnectedToAcceptMeasurement
}
