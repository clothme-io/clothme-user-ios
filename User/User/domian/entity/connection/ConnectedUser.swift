//
//  ConnectedUser.swift
//  Connection
//
//  Created by MACPRO on 2020-04-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


class ConnectedUser : Entity {
    
    private let Id: UserId
    private var firstName: FirstName
    private var lastName: LastName
    private var city: City
    private var gender: Gender
    private var profession: Profession
    private var phoneNumber: PhoneNumber?
    private var email: UserEmail
    private var shippingAddress: ShippingAddress?
//    private var clotheMeasurement: [String?]
//    private var brands: [String?]
//    private var fitProducts: [String?]
    
    private init(
        id: UserId,
        firstName: FirstName,
        lastName: LastName,
        city: City,
        gender: Gender,
        profession: Profession,
        phoneNumber: PhoneNumber?,
        email: UserEmail,
        shippingAddress: ShippingAddress?
    ) {
        self.Id = id
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
        self.gender = gender
        self.profession = profession
        self.phoneNumber = phoneNumber
        self.email = email
        self.shippingAddress = shippingAddress
    }
    
    public static func Create () {}
    
    
}



