//
//  PantMeasurement.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct BottomMeasurement : Equatable {
    private var _waist: MeasurementUnit
    private var _highWaist: MeasurementUnit
    private var _hip: MeasurementUnit
    private var _thigh: MeasurementUnit
    private var _croach: MeasurementUnit
    private var _inseamToKnee: MeasurementUnit
    private var _inseamToHeel: MeasurementUnit
    private var _waistToAnkle: MeasurementUnit
    private var _waistToHeel: MeasurementUnit
    private var _waistToKnee: MeasurementUnit
    
    private init(
        waist: MeasurementUnit,
        highWaist: MeasurementUnit,
        hip: MeasurementUnit,
        thigh: MeasurementUnit,
        croach: MeasurementUnit,
        inseamToKnee: MeasurementUnit,
        inseamToHeel: MeasurementUnit,
        waistToAnkle: MeasurementUnit,
        waistToHeel: MeasurementUnit,
        waistToKnee: MeasurementUnit
    ) {
        self._waist = waist
        self._highWaist = highWaist
        self._hip = hip
        self._thigh = thigh
        self._croach = croach
        self._inseamToKnee = inseamToKnee
        self._inseamToHeel = inseamToHeel
        self._waistToAnkle = waistToAnkle
        self._waistToHeel = waistToHeel
        self._waistToKnee = waistToKnee
    }
    
    static func create(
        waist: MeasurementUnit,
        highWaist: MeasurementUnit,
        hip: MeasurementUnit,
        thigh: MeasurementUnit,
        croach: MeasurementUnit,
        inseamToKnee: MeasurementUnit,
        inseamToHeel: MeasurementUnit,
        waistToAnkle: MeasurementUnit,
        waistToHeel: MeasurementUnit,
        waistToKnee: MeasurementUnit
    ) -> ResultOption<BottomMeasurement, AppError> {
        if (!validateNotNil(waist: waist, highWaist: highWaist, hip: hip, thigh: thigh, croach: croach, inseamToKnee: inseamToKnee, inseamToHeel: inseamToHeel, waistToAnkle: waistToAnkle, waistToHeel: waistToHeel, waistToKnee: waistToKnee)) {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(BottomMeasurement(waist: waist, highWaist: highWaist, hip: hip, thigh: thigh, croach: croach, inseamToKnee: inseamToKnee, inseamToHeel: inseamToHeel, waistToAnkle: waistToAnkle, waistToHeel: waistToHeel, waistToKnee: waistToKnee))
    }
    
    var waist: MeasurementUnit {
        return self._waist
    }
    
    var highWaist: MeasurementUnit{
        return self._highWaist
    }
    
    var hip: MeasurementUnit {
        return self._hip
    }
    
    var thigh: MeasurementUnit {
        return self._thigh
    }
    
    var croach: MeasurementUnit {
        return self._croach
    }
    
    var inseamToKnee: MeasurementUnit {
        return self._inseamToKnee
    }
    
    var inseamToHeel: MeasurementUnit {
        return self._inseamToHeel
    }
    
    var waistToAnkle: MeasurementUnit {
        return self._waistToAnkle
    }
    
    var waistToHeel: MeasurementUnit {
        return self._waistToHeel
    }
    
    var waistToKnee: MeasurementUnit {
        return self._waistToKnee
    }
    
}

//MARK: Validation
extension BottomMeasurement {
    private static func validateNotNil(
        waist: MeasurementUnit,
        highWaist: MeasurementUnit,
        hip: MeasurementUnit,
        thigh: MeasurementUnit,
        croach: MeasurementUnit,
        inseamToKnee: MeasurementUnit,
        inseamToHeel: MeasurementUnit,
        waistToAnkle: MeasurementUnit,
        waistToHeel: MeasurementUnit,
        waistToKnee: MeasurementUnit
    ) -> Bool {
        let validateWaist = Guard.againstNil(argument: waist)
        let validateHighWaist = Guard.againstNil(argument: highWaist)
        let validateHip = Guard.againstNil(argument: hip)
        let validateThigh = Guard.againstNil(argument: thigh)
        let validateCroach = Guard.againstNil(argument: croach)
        let validateInseamToKnee = Guard.againstNil(argument: inseamToKnee)
        let validateInseamToHeel = Guard.againstNil(argument: inseamToHeel)
        let validateWaistToAnkle = Guard.againstNil(argument: waistToAnkle)
        let validateWaistToHeel = Guard.againstNil(argument: waistToHeel)
        let validateWaistToKnee = Guard.againstNil(argument: waistToKnee)
        if !validateWaist || !validateHighWaist || !validateHip || !validateThigh || !validateCroach || !validateInseamToKnee || !validateInseamToHeel || !validateWaistToAnkle || !validateWaistToHeel || !validateWaistToKnee {
            return false
        }
        return true
    }
}
