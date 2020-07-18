//
//  Model.swift
//  User
//
//  Created by MACPRO on 2020-07-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct AddressData : ResponseDataAble, Equatable {
    let apartmentNumber: String
    let streetNumber: String
    let streetName: String
    let city: String
    let stateOrPostalCode: String
    let country: String
}

struct PhoneNumberData : ResponseDataAble, Equatable{
    let value: String
    let type: String
}


struct FullBodyMeasurementData : ResponseDataAble {
    
}
