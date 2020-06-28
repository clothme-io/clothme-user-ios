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
    
    private let userId: UserId
    private var _profileImg : ProfileImage?
    private var _firstName : FirstName
    private var _lastName : LastName?
    private var _gender: Gender
    private var _email: UserEmail?
    private var _password: Password?
    private var _phoneNumber: PhoneNumber?
    private var _billingAddress: [StreetAddress?]?
    private var _city: City
    private var _dateOfBirth : DateOfBirth?
    private var _age : Age?
    private var _profession : Profession?
    private var _fullBodyMeasurement : FullBodyMeasurement?
    private var _topMeasurement: TopMeasurement?
    private var _bottomMeasurement: BottomMeasurement?
    private var _shoeMeasurement: ShoeMeasurement?
    
    //MARK: SubDomain
    private var _account: Account?
    private var _connection: Connection?
    
    internal required init(
        _id: String?,
        profileImage: ProfileImage?,
        firstName: FirstName,
        lastName: LastName?,
        gender: Gender,
        email: UserEmail?,
        city: City,
        phoneNumber: PhoneNumber?,
        billingAddress: [StreetAddress?],
        dateOfBirth: DateOfBirth?,
        profession: Profession?,
        fullBodyMeasurement: FullBodyMeasurement?,
        topMeasurement: TopMeasurement?,
        bottomMeasurement: BottomMeasurement?,
        shoeMeasurement: ShoeMeasurement?
    ) {
        self.userId = UserId(_id: _id)
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
        if let fullBodyMeasurement = fullBodyMeasurement,
            let topMeasurement = topMeasurement,
            let bottomMeasurement = bottomMeasurement,
            let shoeMeasurement = shoeMeasurement {
            self._fullBodyMeasurement = fullBodyMeasurement
            self._topMeasurement = topMeasurement
            self._bottomMeasurement = bottomMeasurement
            self._shoeMeasurement = shoeMeasurement
        }
       
        super.init(_id: self.userId.toString())
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
        profession: Profession?,
        fullBodyMeasurement: FullBodyMeasurement?,
        topMeasurement: TopMeasurement?,
        bottomMeasurement: BottomMeasurement?,
        shoeMeasurement: ShoeMeasurement?
    ) -> User {
        return self.init(_id: id, profileImage: profileImage, firstName: firstName, lastName: lastName, gender: gender, email: email, city: city, phoneNumber: phoneNumber, billingAddress: streetAddress, dateOfBirth: dateOfBirth, profession: profession, fullBodyMeasurement: fullBodyMeasurement, topMeasurement: topMeasurement, bottomMeasurement: bottomMeasurement, shoeMeasurement: shoeMeasurement)
    }
    
    static func createFromSignIn (
        id: String,
        firstName: FirstName,
        gender: Gender,
        city: City
    ) -> User {
        // do some verification
        return self.init(_id: id, profileImage: nil, firstName: firstName, lastName: nil, gender: gender, email: nil, city: city, phoneNumber: nil, billingAddress: [nil], dateOfBirth: nil, profession: nil, fullBodyMeasurement: nil, topMeasurement: nil, bottomMeasurement: nil, shoeMeasurement: nil)
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
    
    var fullBodyMeasurement: FullBodyMeasurement? {
        return self._fullBodyMeasurement
    }
    
    var topMeasurement: TopMeasurement? {
        return self._topMeasurement
    }
    
    var bottomMeasurement: BottomMeasurement? {
        return self._bottomMeasurement
    }
    
    var shoeMeasurement: ShoeMeasurement? {
        return self._shoeMeasurement
    }
    
    // MARK: AddAccount
    
    // MARK: RemoveAccount
    
    // MARK UpdateAccount
    
}

