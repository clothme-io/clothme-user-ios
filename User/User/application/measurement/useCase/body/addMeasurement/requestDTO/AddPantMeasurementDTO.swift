//
//  AddPantMeasurementDTO.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct AddPantMeasurementDTO : RequestDataAble, MeasurementDataAble {
    
    let highWaist: [String: Double]
    let waist: [String: Double]
    let hip: [String: Double]
    let inseam: [String: Double]
    let waistToHip: [String: Double]
    let waistToKnee: [String: Double]
    let waistToAnkle: [String: Double]
    let waistToHeel: [String: Double]
    
}
