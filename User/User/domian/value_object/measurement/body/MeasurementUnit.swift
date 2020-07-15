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
    
    private init(withWidth width: Double, withHeight height: Double) {
        self._width = width;
        self._height = height;
    }
    
    static func set (withWidth width: Double, withHeight height: Double) -> ResultOption<MeasurementUnit, AppError> {
        return validateForNegativeValue(width: width, height: height)
                .bind(validateForNilValue)
                .bind(initMeasurementUnit)
    }
    
}


// MARK: Updating
extension MeasurementUnit {
    
    func update (withWidth width: Double, withHeight height: Double) -> MeasurementUnit {
        return MeasurementUnit(withWidth: width, withHeight: height);
    }
    
    func updateHeight (_ value: Double, currentMeasurement: MeasurementUnit) -> ResultOption<MeasurementUnit, AppError> {
        if (currentMeasurement._height == value) {
            return .error(AppError.alreadyExist)
        }
        
        return .ok(MeasurementUnit.init(withWidth: currentMeasurement._width, withHeight: value))
    }
    
    func updateWidth (_ value: Double, currentMeasurement: MeasurementUnit) -> ResultOption<MeasurementUnit, AppError> {
        if (currentMeasurement._height == value) {
            return .error(AppError.alreadyExist)
        }
        
        return .ok(MeasurementUnit.init(withWidth: value, withHeight: currentMeasurement._height))
    }
    
}



// MAR: Validation
extension MeasurementUnit {
    private static func validateForNegativeValue (width: Double, height: Double) -> ResultOption<(Double, Double), AppError> {
        let validWidth = Guard.againstNegative(value: width)
        let validHeight = Guard.againstNegative(value: height)
        if validWidth && validHeight {
            return .ok((width, height))
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateForNilValue (width: Double, height: Double) -> ResultOption<(Double, Double), AppError> {
        let validWidth = Guard.againstNil(argument: width)
        let validHeight = Guard.againstNil(argument: height)
        if validWidth && validHeight {
            return .ok((width, height))
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func initMeasurementUnit(width: Double, height: Double) -> ResultOption<MeasurementUnit, AppError> {
        return .ok(MeasurementUnit(withWidth: width, withHeight: height))
    }
}
