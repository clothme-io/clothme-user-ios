//
//  ShoeMeasurement.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct FeetMeasurement : Equatable {
    private let _ankle: MeasurementUnit
    private let _ankleToHell: MeasurementUnit
    private let _heelToToe: MeasurementUnit
    
    private init(ankle: MeasurementUnit, ankleToHeel: MeasurementUnit, heelToToe: MeasurementUnit) {
        self._ankle = ankle
        self._ankleToHell = ankleToHeel
        self._heelToToe = heelToToe
    }
    
    static func create(with ankle: MeasurementUnit, with ankleToHeel: MeasurementUnit, with heelToToe: MeasurementUnit) -> ResultOption<FeetMeasurement, AppError> {
        if (!validateForNilValue(ankle: ankle, ankleToHeel: ankleToHeel, heelToToe: heelToToe)) {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(FeetMeasurement(ankle: ankle, ankleToHeel: ankleToHeel, heelToToe: heelToToe))
    }
    
    var ankle: MeasurementUnit {
        return self._ankle
    }
    
    var ankleToHeel: MeasurementUnit {
        return self._ankleToHell
    }
    
    var heelToToe: MeasurementUnit {
        return self._heelToToe
    }
}

// MARK: Validation
extension FeetMeasurement {
    private static func validateForNilValue(ankle: MeasurementUnit, ankleToHeel: MeasurementUnit, heelToToe: MeasurementUnit) -> Bool {
        let validAnkle = Guard.againstNil(argument: ankle)
        let validAnkleToHeel = Guard.againstNil(argument: ankleToHeel)
        let validheelToToe = Guard.againstNil(argument: heelToToe)
        if !validAnkle || !validAnkleToHeel || !validheelToToe {
            return false
        }
        return true
    }
}

