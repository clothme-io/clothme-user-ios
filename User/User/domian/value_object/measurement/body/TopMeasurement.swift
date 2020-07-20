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
    private var _shoulderToWrist: MeasurementUnit
    private var _shoulderToElbow: MeasurementUnit
    private var _bicep: MeasurementUnit
    private var _armPitHole: MeasurementUnit
    private var _shoulderLength: MeasurementUnit
    private var _shoulderToWaist: MeasurementUnit
    
    private init(
        neck: MeasurementUnit,
        bust: MeasurementUnit,
        shoulderToWrist: MeasurementUnit,
        shoulderElbow: MeasurementUnit,
        bicep: MeasurementUnit,
        armPitHole: MeasurementUnit,
        shoulderLength: MeasurementUnit,
        shoulderToWaist: MeasurementUnit
    ) {
        self._neck = neck
        self._bust = bust
        self._shoulderToWrist = shoulderToWrist
        self._shoulderToElbow = shoulderElbow
        self._bicep = bicep
        self._armPitHole = armPitHole
        self._shoulderLength = shoulderLength
        self._shoulderToWaist = shoulderToWaist
    }
    
    public static func create (
        neck: MeasurementUnit,
        bust: MeasurementUnit,
        shoulderToWrist: MeasurementUnit,
        shoulderElbow: MeasurementUnit,
        bicep: MeasurementUnit,
        armPitHole: MeasurementUnit,
        shoulderLength: MeasurementUnit,
        shoulderToWaist: MeasurementUnit
    ) -> ResultOption<TopMeasurement, AppError> {
        return .ok(TopMeasurement(neck: neck, bust: bust, shoulderToWrist: shoulderToWrist, shoulderElbow: shoulderElbow, bicep: bicep, armPitHole: armPitHole, shoulderLength: shoulderLength, shoulderToWaist: shoulderToWaist))
    }
    
    var neck: MeasurementUnit {
        return self._neck
    }
    
    var shoulderToWrist: MeasurementUnit {
        return self._shoulderToWrist
    }
    
    var shoulderToElbow: MeasurementUnit {
        return self._shoulderToElbow
    }
    
    var bicep: MeasurementUnit {
        return self._bicep
    }
    
    var armPitHole: MeasurementUnit {
        return self._armPitHole
    }
    
    var shoulderLength: MeasurementUnit {
        return self._shoulderLength
    }
    
    var shoulderToWaist: MeasurementUnit {
        return self._shoulderToWaist
    }
    
//    public func change () -> Result<TopMeasurement, ValidationError> {
//        
//    }
    
}



// MARK: Validation
extension TopMeasurement {
    private static func validateMeasurment(_ argument: MeasurementUnit?) -> Bool {
        if argument == nil {
            return false
        }
        return true
    }
}


