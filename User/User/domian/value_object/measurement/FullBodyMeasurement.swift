//
//  FullBody.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct FullBodyMeasurement : Equatable {
   
    private var _top: TopMeasurement
    private var _bottom: BottomMeasurement
    private var _shoe: FeetMeasurement
    
    private init(top: TopMeasurement, bottom: BottomMeasurement, shoe: FeetMeasurement) {
        self._top = top
        self._bottom = bottom
        self._shoe = shoe
    }
    
    public static func create (with top: TopMeasurement, with bottom: BottomMeasurement, and feet: FeetMeasurement) -> Result<FullBodyMeasurement, AppError> {
        if (!validateNilValue(top: top, bottom: bottom, feet: feet)) {
            return .failure(AppError.nilValueNotAllowed)
        }
        return .success(FullBodyMeasurement(top: top, bottom: bottom, shoe: feet))
    }
    
    static func == (lhs: FullBodyMeasurement, rhs: FullBodyMeasurement) -> Bool {
        return lhs._top == rhs._top &&
            lhs._bottom == rhs._bottom &&
            lhs._shoe == rhs._shoe
       }
    
}


//MARK: Validation
extension FullBodyMeasurement {
    private static func validateNilValue(top: TopMeasurement, bottom: BottomMeasurement, feet: FeetMeasurement) -> Bool {
        let validateTopMeasurement = Guard.againstNil(argument: top)
        let validateBottomMeasurement = Guard.againstNil(argument: bottom)
        let validateFeetMeasurement = Guard.againstNil(argument: feet)
        
        if !validateTopMeasurement || !validateBottomMeasurement || !validateFeetMeasurement {
            return false
        }
        return true
    }
}
