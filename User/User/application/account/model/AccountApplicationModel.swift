//
//  AccountData.swift
//  User
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct AccountApplicationModel : ResponseDataAble {
    let ownerId: String
    let accountUsers: [AccountUserData]
    let numberOfAccount: Int
}

struct AccountUserData: ResponseDataAble {
    let accountId: String
    let userId: String
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let gender: String
    let phoneNumber: [PhoneNumberData]
    let relationship: String
    let dateAdded: String
    let shippingAddress: [AddressData?]
    let brandIds: [String?]
}

struct PhoneNumberData: ResponseDataAble {
    let value: String
    let type: String
}
