//
//  AddFullBodyMeasurementDTO.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct AddFullBodyMeasurementDTO : RequestDataAble, MeasurementDataAble {

    let head: [String: Double]
    let eyeLashToChin: [String: Double]
    let earToNose: [String: Double]
    let neck: [String: Double]
    let shoulder: [String: Double]
    let shoulderToWaist: [String: Double]
    let shoulderLength: [String: Double]
    let shoulderToElbow: [String: Double]
    let shoulderToWrist: [String: Double]
    let armPitHole: [String: Double]
    let bicep: [String: Double]
    let bust: [String: Double]
    let tummy: [String: Double]
    let highWaist: [String: Double]
    let waist: [String: Double]
    let hip: [String: Double]
    let inseam: [String: Double]
    let waistToHip: [String: Double]
    let waistToKnee: [String: Double]
    let waistToAnkle: [String: Double]
    let waistToHeel: [String: Double]
    let feet: [String: Double]
    let ankleToHeel: [String: Double]
    
}
