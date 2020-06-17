//
//  UserData.swift
//  User
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct UserApplicationModel : ResponseDataAble {
    let userId: String
    let firstName: String
    let lastName: String?
    let gender: String
    let email: String
    let phoneNumber: String?
    let profession: String?
    let currentCity: String
//    let billingAddress: [AddressData]?
//    let shippingAddress: [AddressData]?
//    let measurement: MeasurementData

}


struct AddressData : ResponseDataAble {
    let streetNumber: String
    let streetName: String
    let city: String
    let code: String
    let country: String
}


struct MeasurementData : ResponseDataAble {
    let fullBodyMeasurement: FullBodyMeasurementData
    let topMeasurement: TopMeasurementData
}

struct FullBodyMeasurementData : ResponseDataAble {
    
}

struct TopMeasurementData : ResponseDataAble {
    
}

struct BottomMeasurementData : ResponseDataAble {
    
}

struct ShoeMeasurmentData : ResponseDataAble {
    
}
