//
//  User.swift
//  User
//
//  Created by MACPRO on 2020-03-24.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public class User : AggregateRoot {
    
    private var _profileImg : ProfileImage?
    private var _firstName : FirstName
    private var _lastName : LastName?
    private var _gender: Gender
    private var _email: UserEmail?
    private var _password: Password?
    private var _phoneNumber: PhoneNumber?
    private var _city: City
    private var _country: Country
    private var _dateOfBirth : DateOfBirth?
    private var _profession : Profession?
    private var _shippingAddress: [ShippingAddress]?
    private var _billingAddress: [BillingAddress]?
    
    
    internal required init(
        profileImage: ProfileImage?,
        firstName: FirstName,
        lastName: LastName?,
        gender: Gender,
        email: UserEmail?,
        phoneNumber: PhoneNumber?,
        city: City,
        country: Country,
        dateOfBirth: DateOfBirth?,
        profession: Profession?,
        shippingAddress: [ShippingAddress]?,
        billingAddress: [BillingAddress]?
    ) {
        if let profileImage = profileImage,
            let lastName = lastName,
            let email = email,
            let shippingAddress = shippingAddress,
            let billingAddress = billingAddress {
            self._profileImg = profileImage
            self._lastName = lastName
            self._gender = gender
            self._email = email
            self._shippingAddress = shippingAddress
            self._billingAddress = billingAddress
        }
        self._firstName = firstName
        self._gender = gender
        self._city = city
        self._country = country
        super.init(_id: Guid(value: nil))
    }
    
    static func create (
        profileImage: ProfileImage?,
        firstName: FirstName,
        lastName: LastName?,
        gender: Gender,
        email: UserEmail?,
        phoneNumber: PhoneNumber?,
        city: City,
        country: Country,
        dateOfBirth: DateOfBirth?,
        profession: Profession?,
        shippingAddress: [ShippingAddress]?,
        billingAddress: [BillingAddress]?
    ) -> User {
        return self.init(profileImage: profileImage, firstName: firstName, lastName: lastName, gender: gender, email: email, phoneNumber: phoneNumber, city: city, country: country, dateOfBirth: dateOfBirth, profession: profession, shippingAddress: shippingAddress, billingAddress: billingAddress)
    }
    
    var id: UserId {
        return UserId(_id: nil)
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
    
    var city: City? {
        return self._city
    }
    
    var phoneNumber: PhoneNumber? {
        return self._phoneNumber
    }
    
    var dateOfBirth: DateOfBirth? {
        return self._dateOfBirth
    }
    
    var age: Age {
        if let dateOfBirth = dateOfBirth {
            let userAge = Age.create(dateOfBirth: dateOfBirth.value)
            return userAge.getValue(result: userAge)
        }
    }
    
    var profession: Profession? {
        return self._profession
    }
    
}

