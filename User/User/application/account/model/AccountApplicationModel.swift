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
    let accountUsers: [AccountUserApplicationModel]
    let numberOfAccount: Int
}

struct AccountUserApplicationModel: ResponseDataAble {
    let accountId: String
    let userId: String
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let gender: String
    let phoneNumber: [PhoneNumberAppliastionModel?]
    let relationship: String
    let dateAdded: String
    let shippingAddress: [AddressApplicationModel?]
    let brandId: [String?]
}

