//
//  PantMeasurement.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

struct BottomMeasurement : Equatable {
    private var waist: MeasurementUnit
    private var inseam: MeasurementUnit
    private var croach: MeasurementUnit
    private var hip: MeasurementUnit
    private var waistToAnkle: MeasurementUnit
    private var ankle: MeasurementUnit?
    private var waistToKnee: MeasurementUnit?
    private var waistToHip: MeasurementUnit?
    private var highWaist: MeasurementUnit?
}


// Comforming to MeasurementType
extension BottomMeasurement : MeasurementType {}
