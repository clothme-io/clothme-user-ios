//
//  AddShoeMeasurementDTO.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct AddShoeMeasurementDTO : RequestDataAble, MeasurementDataAble {
    
    let ankleToHeel: [String: Double]
    let feet: [String: Double]
    
}
