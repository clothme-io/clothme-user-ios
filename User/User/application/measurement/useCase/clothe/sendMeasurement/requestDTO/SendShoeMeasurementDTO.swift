//
//  ShoeMeasurementDTO.swift
//  User
//
//  Created by MACPRO on 2020-04-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct SendShoeMeasurementDTO : RequestDataAble, MeasurementDataAble {
    
    let receivingUserId: String
    let sendingUserId: String
    let sentDate: String
    let measurementType = "shoeMeasurement"
    
    struct measurment {
        let ankleToHeel: [String: Double]
        let feet: [String: Double]
    }
}
