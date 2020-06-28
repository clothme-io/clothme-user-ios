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
    private var _dateOfBirth : DateOfBirth?
    private var _age : Age?
    private var _profession : Profession?
    private var _shippingAddress: [StreetAddress]?
    private var _billingAddress: [StreetAddress]?
    
    //MARK: SubDomain
    private var _account: Account?
    private var _connection: Connection?
    
    internal required init(
        profileImage: ProfileImage?,
        firstName: FirstName,
        lastName: LastName?,
        gender: Gender,
        email: UserEmail?,
        city: City,
        country: Country,
        dateOfBirth: DateOfBirth?,
        profession: Profession?,
        phoneNumber: PhoneNumber?,
        billingAddress: [StreetAddress?]
    ) {
        if let profileImage = profileImage,
            let lastName = lastName,
            let email = email {
            self._profileImg = profileImage
            self._lastName = lastName
            self._gender = gender
            self._email = email
        }
        self._firstName = firstName
        self._gender = gender
        self._city = city
        super.init(_id: Guid(value: nil))
    }
    
    static func create (
        id: String?,
        profileImage: ProfileImage?,
        firstName: FirstName,
        lastName: LastName?,
        gender: Gender,
        email: UserEmail?,
        city: City,
        phoneNumber: PhoneNumber?,
        streetAddress: [StreetAddress?],
        dateOfBirth: DateOfBirth?,
        profession: Profession?
    ) -> User {
        return self.init(profileImage: profileImage, firstName: firstName, lastName: lastName, gender: gender, email: email, city: city, phoneNumber: phoneNumber, billingAddress: streetAddress, dateOfBirth: dateOfBirth, profession: profession)
    }
    
    static func createFromSignIn (
        firstName: FirstName,
        gender: Gender,
        city: City
    ) -> User {
        // do some verification
        return self.init(profileImage: nil, firstName: firstName, lastName: nil, gender: gender, email: nil, city: city, phoneNumber: nil, billingAddress: [nil], dateOfBirth: nil, profession: nil)
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
    
    var profession: Profession? {
        return self._profession
    }
    
    // MARK: AddAccount
    
    // MARK: RemoveAccount
    
    // MARK UpdateAccount
    
}

