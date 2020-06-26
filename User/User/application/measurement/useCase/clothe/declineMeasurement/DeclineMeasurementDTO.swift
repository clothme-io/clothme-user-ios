//
//  DeclineMeasurementDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct DeclineMeasurementDTO : RequestDataAble, MeasurementDataAble {
    
    let receivingUserId: String
    let sendingUserId: String
    let sentDate: String
    let decision: Bool
    let measurementType: String
    
}
