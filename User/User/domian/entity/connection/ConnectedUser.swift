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
    private let _connectionId: ConnectionId
    private let _Id: UserId
    private var _firstName: FirstName
    private var _lastName: LastName
    private var _city: ZipOrPostalCode
    private var _gender: Gender
    private var _profession: Profession
    private var _phoneNumber: PhoneNumber?
    private var _email: UserEmail
    private var _shippingAddress: ShippingAddress?
    private var _connectionDate: ConnectionDate
    private var _connectionDuration: ConnectionDuration
//    private var clotheMeasurement: [ClotheMeasurement?]
//    private var brands: [String?]
//    private var fitProducts: [String?]
    
    private init(
        connectionId: ConnectionId,
        userId: UserId,
        firstName: FirstName,
        lastName: LastName,
        city: ZipOrPostalCode,
        gender: Gender,
        profession: Profession,
        phoneNumber: PhoneNumber?,
        email: UserEmail,
        shippingAddress: ShippingAddress?,
        connectionDate: ConnectionDate,
        connectionDuration: ConnectionDuration
    ) {
        self._Id = userId
        self._firstName = firstName
        self._lastName = lastName
        self._city = city
        self._gender = gender
        self._profession = profession
        self._phoneNumber = phoneNumber
        self._email = email
        self._shippingAddress = shippingAddress
        self._connectionDate = connectionDate
        self._connectionDuration = connectionDuration
        self._connectionId = ConnectionId.create(id: Guid(value: connectionId.value().toString())).OptionalData().value ?? ConnectionId.create(id: nil).OptionalData().value!
        super.init(_id: Guid(value: self._connectionId.value().toString()))
    }
    
    public static func Create(
        connectionId: ConnectionId,
        userId: UserId,
        firstName: FirstName,
        lastName: LastName,
        city: ZipOrPostalCode,
        gender: Gender,
        profession: Profession,
        phoneNumber: PhoneNumber?,
        email: UserEmail,
        shippingAddress: ShippingAddress?,
        connectionDate: ConnectionDate,
        connectionDuration: ConnectionDuration
    ) -> ResultOption<ConnectedUser, AppError> {
        return .ok(ConnectedUser(connectionId: connectionId, userId: userId, firstName: firstName, lastName: lastName, city: city, gender: gender, profession: profession, phoneNumber: phoneNumber, email: email, shippingAddress: shippingAddress, connectionDate: connectionDate, connectionDuration: connectionDuration))
    }
    
    var connectionId: ConnectionId {
        return self._connectionId
    }
    
    var userId: UserId {
        return self._Id
    }
    
    var firstName: FirstName {
        return self._firstName
    }
    
    var lastName: LastName {
        return self._lastName
    }
    
    var city: ZipOrPostalCode {
        return self._city
    }
    
    var gender: Gender {
        return self._gender
    }
    
    var profession: Profession {
        return self._profession
    }
    
    var phoneNumber: PhoneNumber? {
        return self._phoneNumber
    }
    
    var email: UserEmail {
        return self._email
    }
    
    var shippingAddress: ShippingAddress? {
        return self._shippingAddress
    }
    
    var connectionDate: ConnectionDate {
        return self._connectionDate
    }
    
    var connectionDuration: ConnectionDuration {
        return self._connectionDuration
    }
    
}



