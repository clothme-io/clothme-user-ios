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
    let country: String
    let tier: String
    let billingAddress: [AddressData]?
    let shippingAddress: [AddressData]?
    let fullBodyMeasurement: FullBodyMeasurementData

}


struct AddressData : ResponseDataAble, Sequence, Equatable {
    let streetNumber: String
    let streetName: String
    let city: String
    let postalOrZipCode: String
    let country: String
}


struct FullBodyMeasurementData : ResponseDataAble {
    
}


