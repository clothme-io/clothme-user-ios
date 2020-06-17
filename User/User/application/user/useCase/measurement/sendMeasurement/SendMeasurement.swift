//
//  SendMeasurementUseCase.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct SendMeasurement : UseCaseAble {
    
    var _measurementRepo: MeasurementRepository
    
    init(measurementRepo: MeasurementRepository) {
        self._measurementRepo = measurementRepo
    }
    
    public func execute(with data: MeasurementDataAble) {}
    
}
