//
//  UserData.swift
//  User
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public struct UserApplicationModel : ResponseDataAble {
    let userId: String
    let profileImageUrl: String
    let firstName: String
    let lastName: String
    let gender: String
    let email: String
    let phoneNumber: [PhoneNumberAppliastionModel?]
    let profession: String
    let currentCity: String
    let country: String
    let dateOfBirth: String
    let tier: String
    let billingAddress: [AddressApplicationModel?]
    let shippingAddress: [AddressApplicationModel?]
}




