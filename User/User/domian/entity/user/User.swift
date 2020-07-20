//
//  User.swift
//  User
//
//  Created by MACPRO on 2020-03-24.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class User : Entity {
    private let _userId: UserId?
    private var _profileImg : ProfileImage?
    private var _firstName : FirstName
    private var _lastName : LastName?
    private var _gender: Gender
    private var _email: UserEmail
    private var _password: Password?
    private var _phoneNumber: [PhoneNumber?]
    private var _city: City
    private var _zipOrPostalCode: ZipOrPostalCode?
    private var _country: Country
    private var _dateOfBirth : DateOfBirth?
    private var _profession : Profession?
    private var _tier: UserTier
    private var _shippingAddress: [ShippingAddress?]
    private var _billingAddress: [BillingAddress?]
    
    internal required init(
        userId: UserId?,
        profileImage: ProfileImage?,
        firstName: FirstName,
        lastName: LastName?,
        gender: Gender,
        email: UserEmail,
        phoneNumber: [PhoneNumber?],
        city: City,
        country: Country,
        dateOfBirth: DateOfBirth?,
        profession: Profession?,
        tier: UserTier,
        shippingAddress: [ShippingAddress?],
        billingAddress: [BillingAddress?]
    ) {
        if let profileImage = profileImage,
            let lastName = lastName,
            let dateOfBirth = dateOfBirth,
            let profession = profession {
            self._profileImg = profileImage
            self._lastName = lastName
            self._gender = gender
            self._dateOfBirth = dateOfBirth
            self._profession = profession
        }
        self._firstName = firstName
        self._gender = gender
        self._email = email
        self._city = city
        self._phoneNumber = phoneNumber
        self._tier = tier
        self._country = country
        self._shippingAddress = shippingAddress
        self._billingAddress = billingAddress
        self._userId = UserId.create(id: Guid(value: userId?.value().toString())).getData()
        super.init(_id: Guid(value: self._userId?.value().toString()))
    }
    
    static func create (
        userId: UserId?,
        profileImage: ProfileImage?,
        firstName: FirstName,
        lastName: LastName?,
        gender: Gender,
        email: UserEmail,
        phoneNumber: [PhoneNumber],
        city: City,
        country: Country,
        dateOfBirth: DateOfBirth?,
        profession: Profession?,
        tier: UserTier,
        shippingAddress: [ShippingAddress?],
        billingAddress: [BillingAddress?]
    ) -> ResultOption<User, AppError> {
        return .ok(self.init(userId: userId, profileImage: profileImage, firstName: firstName, lastName: lastName, gender: gender, email: email, phoneNumber: phoneNumber, city: city, country: country, dateOfBirth: dateOfBirth, profession: profession, tier: tier, shippingAddress: shippingAddress, billingAddress: billingAddress))
    }
    
    var userId: UserId? {
        return self._userId
    }
    
    var profileImage: ProfileImage? {
        return self._profileImg
    }
    
    var firstName: FirstName {
        return self._firstName
    }
    
    var lastname: LastName? {
        return self._lastName
    }
    
    var gender: Gender {
        return self._gender
    }
    
    var email: UserEmail? {
        return self._email
    }
    
    var password: Password? {
        return self._password
    }
    
    var city: City {
        return self._city
    }
    
    var country: Country {
        return self._country
    }
    
    var phoneNumber: [PhoneNumber?] {
        return self._phoneNumber
    }
    
    var dateOfBirth: DateOfBirth? {
        return self._dateOfBirth
    }
    
    var age: Age {
        let userAge = Age.create(with: dateOfBirth?.value ?? "")
        return userAge.getValue(result: userAge)
    }
    
    var profession: Profession? {
        return self._profession
    }
    
    var tier: UserTier {
        return self._tier
    }
    
    var shippingAddress: [ShippingAddress?] {
        return self._shippingAddress
    }
    
    var billingAddress: [BillingAddress?] {
        return self._billingAddress
    }
    
}

