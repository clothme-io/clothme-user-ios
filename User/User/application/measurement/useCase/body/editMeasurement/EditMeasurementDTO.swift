//
//  EditMeasurementDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct EditMeasurementDTO : RequestDataAble, MeasurementDataAble {
    
    let userId: String
    let measurementType: String
    let measurment: FullBodyMeasurementDTO

}
