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
    private let userId: UserId
    private var bodyMeasurement: FullBodyMeasurement
    private var clotheMeasurement: ClotheMeasurement?
    
    private init(
        userId: UserId,
        bodyMeasurement: FullBodyMeasurement,
        clotheMeasurement: ClotheMeasurement
    ) {
        self.userId = userId
        self.bodyMeasurement = bodyMeasurement
        if let clotheMeasurement = clotheMeasurement {
            self.clotheMeasurement = clotheMeasurement
        }
        super.init(_id: nil)
    }
}
