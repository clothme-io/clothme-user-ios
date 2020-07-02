//
//  Measurement.swift
//  User
//
//  Created by MACPRO on 2020-06-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class Measurement : Entity {
    private let _userId: UserId
    private var _bodyMeasurement: FullBodyMeasurement
    private var _clotheMeasurement: ClotheMeasurement?
    
    private init(
        userId: UserId,
        bodyMeasurement: FullBodyMeasurement,
        clotheMeasurement: ClotheMeasurement?
    ) {
        self._userId = userId
        self._bodyMeasurement = bodyMeasurement
        if let clotheMeasurement = clotheMeasurement {
            self._clotheMeasurement = clotheMeasurement
        }
        super.init(_id: nil)
    }
    
    static func create(userId: UserId, bodyMeasurement: FullBodyMeasurement, clotheMeasurement: ClotheMeasurement) -> ResultOption<Measurement, ValidationError> {
        return .ok(Measurement(userId: userId, bodyMeasurement: bodyMeasurement, clotheMeasurement: clotheMeasurement))
    }
    
    var userId: UserId {
        return self._userId
    }
    
    var bodyMeasurement: FullBodyMeasurement {
        return self._bodyMeasurement
    }
    
    var clotheMeasurement: ClotheMeasurement? {
        return self._clotheMeasurement
    }
}
