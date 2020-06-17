//
//  GetUserDTO.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import UIKit
import Core


struct GetUserDTO: RequestDataAble {
    let userId : String
    let profileImg : String
    let firstName : String
    let lastName : String
    let gender: Int
    let email: String
    let password: String
    let phoneNumber: [PhoneNumberDTO]
    let address: [AddressDTO]
    let dateOfBirth : String
    let age : Int
    let profession : String
    let fullBodyMeasurement : Double
    let topMeasurement: Double
    let bottomMeasurement: Double
    let shoeMeasurement: Double
}

struct AddressDTO: RequestDataAble {
    let streetAddress: String
    let country: String
}

struct PhoneNumberDTO: RequestDataAble {
    let type: String
    let number: String
}
