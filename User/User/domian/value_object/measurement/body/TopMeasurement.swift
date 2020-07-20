//
//  TopMeasurement.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct TopMeasurement : Equatable {
    private var _neck: MeasurementUnit
    private var _bust: MeasurementUnit
    private var _bicep: MeasurementUnit
    private var _armPitHole: MeasurementUnit
    private var _wrist: Measurement
    private var _shoulderLength: MeasurementUnit
    private var _shoulderToUnderBust: Measurement
    private var _shoulderToElbow: MeasurementUnit
    private var _shoulderToWrist: MeasurementUnit
    private var _shoulderToWaist: MeasurementUnit
    private var _tummy: Measurement
    private var _torso: Measurement
    private var _waist: Measurement
    private var _highWaist: Measurement
    
    private init(
        neck: MeasurementUnit,
        bust: MeasurementUnit,
        bicep: MeasurementUnit,
        armPitHole: MeasurementUnit,
        wrist: Measurement,
        shoulderLength: MeasurementUnit,
        shoulderToUnderBust: Measurement,
        shoulderToElbow: MeasurementUnit,
        shoulderToWrist: MeasurementUnit,
        shoulderToWaist: MeasurementUnit,
        tummy: Measurement,
        torso: Measurement,
        waist: Measurement,
        highWaist: Measurement
    ) {
        self._neck = neck
        self._bust = bust
        self._bicep = bicep
        self._armPitHole = armPitHole
        self._wrist = wrist
        self._shoulderLength = shoulderLength
        self._shoulderToUnderBust = shoulderToUnderBust
        self._shoulderToElbow = shoulderToElbow
        self._shoulderToWrist = shoulderToWrist
        self._shoulderToWaist = shoulderToWaist
        self._tummy = tummy
        self._torso = torso
        self._waist = waist
        self._highWaist = highWaist
    }
    
    public static func create (
        neck: MeasurementUnit,
        bust: MeasurementUnit,
        bicep: MeasurementUnit,
        armPitHole: MeasurementUnit,
        wrist: Measurement,
        shoulderLength: MeasurementUnit,
        shoulderToUnderBust: Measurement,
        shoulderToElbow: MeasurementUnit,
        shoulderToWrist: MeasurementUnit,
        shoulderToWaist: MeasurementUnit,
        tummy: Measurement,
        torso: Measurement,
        waist: Measurement,
        highWaist: Measurement
    ) -> ResultOption<TopMeasurement, AppError> {
        if (!validateMeasurmentNilValue(neck: neck, bust: bust, bicep: bicep, armPitHole: armPitHole, wrist: wrist, shoulderLength: shoulderLength, shoulderToUnderBust: shoulderToUnderBust, shoulderToElbow: shoulderToElbow, shoulderToWrist: shoulderToWrist, shoulderToWaist: shoulderToWaist, tummy: tummy, torso: torso, waist: waist, highWaist: highWaist)) {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(TopMeasurement(neck: neck, bust: bust, bicep: bicep, armPitHole: armPitHole, wrist: wrist, shoulderLength: shoulderLength, shoulderToUnderBust: shoulderToUnderBust, shoulderToElbow: shoulderToElbow, shoulderToWrist: shoulderToWrist, shoulderToWaist: shoulderToWaist, tummy: tummy, torso: torso, waist: waist, highWaist: highWaist))
    }
    
    var neck: MeasurementUnit {
        return self._neck
    }
    
    var bust: MeasurementUnit {
        return self._bust
    }
    
    var bicep: MeasurementUnit {
        return self._bicep
    }
    
    var armPitHole: MeasurementUnit {
        return self._armPitHole
    }
    
    var wrist: Measurement {
        return self._wrist
    }
    
    var shoulderLength: MeasurementUnit {
        return self._shoulderLength
    }
    
    var shoulderToUnderBust: Measurement {
        return self._shoulderToUnderBust
    }
    
    var shoulderToElbow: MeasurementUnit {
        return self._shoulderToElbow
    }
    
    var shoulderToWrist: MeasurementUnit {
        return self._shoulderToWrist
    }
    
    var shoulderToWaist: MeasurementUnit {
        return self._shoulderToWaist
    }
    
    var tummy: Measurement {
        return self._tummy
    }
    
    var torso: Measurement {
        return self._torso
    }
    
    var waist: Measurement {
        return self._waist
    }
    
    var highWaist: Measurement {
        return self._highWaist
    }
    
}

// MARK: Validation
extension TopMeasurement {
    private static func validateMeasurmentNilValue(
        neck: MeasurementUnit,
        bust: MeasurementUnit,
        bicep: MeasurementUnit,
        armPitHole: MeasurementUnit,
        wrist: Measurement,
        shoulderLength: MeasurementUnit,
        shoulderToUnderBust: Measurement,
        shoulderToElbow: MeasurementUnit,
        shoulderToWrist: MeasurementUnit,
        shoulderToWaist: MeasurementUnit,
        tummy: Measurement,
        torso: Measurement,
        waist: Measurement,
        highWaist: Measurement
    ) -> Bool {
        let validNeck = Guard.againstNil(argument: neck)
        let validBust = Guard.againstNil(argument: bust)
        let validBicep = Guard.againstNil(argument: bicep)
        let validArmPitHole = Guard.againstNil(argument: armPitHole)
        let validWrist = Guard.againstNil(argument: wrist)
        let validShoulderLength = Guard.againstNil(argument: shoulderLength)
        let validShoulderToUnderBust = Guard.againstNil(argument: shoulderToUnderBust)
        let validShoulderToElbow = Guard.againstNil(argument: shoulderToElbow)
        let validShoulderToWrist = Guard.againstNil(argument: shoulderToWrist)
        let validShoulderToWaist = Guard.againstNil(argument: shoulderToWaist)
        let validTummy = Guard.againstNil(argument: tummy)
        let validTorso = Guard.againstNil(argument: torso)
        let validWaist = Guard.againstNil(argument: waist)
        let validHighWaist = Guard.againstNil(argument: highWaist)
        
        if !validNeck || !validBust || !validBicep || !validArmPitHole || !validWrist || !validShoulderLength || !validShoulderToUnderBust || !validShoulderToElbow || !validShoulderToWrist || !validShoulderToWaist || !validTummy || !validTorso || !validWaist || !validHighWaist {
            return false
        }
        return true
    }
}


