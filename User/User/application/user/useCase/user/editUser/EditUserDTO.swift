//
//  EditUserDTO.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct EditUserDTO : RequestDataAble {
    let userId : String
    let profileImage: String?
    let firstName : String?
    let lastName : String?
    let gender: Int?
    let email: String?
    let password: String?
    let phoneNumber: PhoneNumberDTO?
    let billingAddress: AddressDTO?
    let shippingAddress: AddressDTO?
    let dateOfBirth : String?
    let age : Int?
    let profession : String?
}

struct AddressDTO: RequestDataAble {
    let streetAddress: StreetAddressDTO
    let city: String
    let zipOrPostalCode: String
    let country: String
}

struct StreetAddressDTO: RequestDataAble {
    let apartmentNumber: String
    let streetNumber: String
    let streetName: String
}

struct PhoneNumberDTO: RequestDataAble {
    let type: String
    let number: String
}
