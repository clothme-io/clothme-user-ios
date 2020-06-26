//
//  AcceptMeasurement.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct AcceptMeasurement : UseCaseAble {
    
    var _measurementRepo: MeasurementRepository
    
    init(measurementRepo: MeasurementRepository) {
        self._measurementRepo = measurementRepo
    }
    
    public func execute(with data: AcceptMeasurementDTO) {}
}
