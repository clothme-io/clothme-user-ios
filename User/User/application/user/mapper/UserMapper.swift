//
//  UserDomainMap.swift
//  User
//
//  Created by MACPRO on 2020-05-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class UserMapper {
    
    static func toDomainModelFromSignIn(data: UserApplicationModel) -> User {
        let firstName: FirstName
        var currentCity: City
        
        let name = FirstName.create(name: data.firstName);
        firstName = name.getValue(result: name)
        
        let city = City.create(city: data.currentCity)
        currentCity = city.getValue(result: city)
      
        return User.createFromSignIn(id: data.userId, firstName: firstName, city: currentCity)
    }
    
    static func toDomainModel(data: UserApplicationModel) {
        
    }
    
    static func toDataModel(data: User) -> UserApplicationModel {
        var dataModel: UserApplicationModel
        let id = UserId(_id: data.id.toString())
        let firstName = FirstName.create(name: data.firstName.toString())
        let lastName = LastName.create(value: data.lastname?.toString() ?? "")
        let email = UserEmail.create(value: data.email?.toString() ?? "")
        let phoneNumber = PhoneNumber.create(with: data.phoneNumber?.toString() ?? "")
        let gender = Gender.create(gender: data.gender?.toString() ?? "")
        let profession = Profession.create(nameWith: data.profession?.toString() ?? "")
        let city = City.create(city: data.city?.toString() ?? "")
        
        dataModel = UserApplicationModel(userId: id.toString(), firstName: firstName.getValue(result: firstName).value, lastName: lastName.getValue(result: lastName).value, gender: gender.getValue(result: gender).value, email: email.getValue(result: email).value, phoneNumber: phoneNumber.getValue(result: phoneNumber).Value, profession: profession.getValue(result: profession).value, currentCity: city.getValue(result: city).value)
        
        return dataModel
    }
}
