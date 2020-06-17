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
    private var _shoe: ShoeMeasurement
    
    private init(top: TopMeasurement, bottom: BottomMeasurement, shoe: ShoeMeasurement) {
        self._top = top
        self._bottom = bottom
        self._shoe = shoe
    }
    
//    public static func create () -> Result<FullBodyMeasurement, ValidationError> {
//        
//    }
    
    static func == (lhs: FullBodyMeasurement, rhs: FullBodyMeasurement) -> Bool {
        return lhs._top == rhs._top &&
            lhs._bottom == rhs._bottom &&
            lhs._shoe == rhs._shoe
       }
    
}



// Comforming to MeasurementType
extension FullBodyMeasurement : MeasurementType {}
