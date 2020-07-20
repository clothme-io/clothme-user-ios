//
//  MeasurementUnit.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct MeasurementUnit : Equatable {
    private var _width: Double;
    private var _height: Double;
    
    private init(width: Double, height: Double) {
        self._width = width;
        self._height = height;
    }
    
    static func set (with width: Double, with height: Double) -> ResultOption<MeasurementUnit, AppError> {
        if (!validateForNilValue(width: width, height: height)) {
            return .error(AppError.nilValueNotAllowed)
        }
        
        if (!validateForNegativeValue(width: width, height: height)) {
            return .error(AppError.negativeValueNotAllowed)
        }
        
        return .ok(MeasurementUnit(width: width, height: height))
    }
    
}


// MARK: Updating
extension MeasurementUnit {
    
    func update (withWidth width: Double, withHeight height: Double) -> MeasurementUnit {
        return MeasurementUnit(width: width, height: height);
    }
    
    func updateHeight (_ value: Double, currentMeasurement: MeasurementUnit) -> ResultOption<MeasurementUnit, AppError> {
        if (currentMeasurement._height == value) {
            return .error(AppError.alreadyExist)
        }
        
        return .ok(MeasurementUnit.init(width: currentMeasurement._width, height: value))
    }
    
    func updateWidth (_ value: Double, currentMeasurement: MeasurementUnit) -> ResultOption<MeasurementUnit, AppError> {
        if (currentMeasurement._height == value) {
            return .error(AppError.alreadyExist)
        }
        
        return .ok(MeasurementUnit.init(width: value, height: currentMeasurement._height))
    }
    
}



// MAR: Validation
extension MeasurementUnit {
    private static func validateForNegativeValue (width: Double, height: Double) -> Bool {
        let validWidth = Guard.againstNegative(value: width)
        let validHeight = Guard.againstNegative(value: height)
        if !validWidth || !validHeight {
            return false
        }
        return true
    }
    
    private static func validateForNilValue (width: Double, height: Double) -> Bool {
        let validWidth = Guard.againstNil(argument: width)
        let validHeight = Guard.againstNil(argument: height)
        if !validWidth || !validHeight {
            return false
        }
        return true
    }
}
