//
//  EditMeasurementResponse.swift
//  User
//
//  Created by MACPRO on 2020-05-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct EditMeasurementResponse : ResponseDataAble {
    let responseMeasurement: MeasurementData
    let userId: String
}
