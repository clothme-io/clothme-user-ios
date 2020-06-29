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
        var gender: Gender
        
        let name = FirstName.create(name: data.firstName);
        firstName = name.getValue(result: name)
        
        let city = City.create(city: data.currentCity)
        currentCity = city.getValue(result: city)
      
        let userGender = Gender.create(gender: data.gender)
        gender = userGender.getValue(result: userGender)
        
        return User.createFromSignIn(id: data.userId, firstName: firstName, gender: gender, city: currentCity)
    }
    
    static func toDomainModel(data: UserApplicationModel) {
        
    }
    
    static func toDataModel(user: User) -> UserApplicationModel {
        return UserApplicationModel(userId: user.id.value().toString(), firstName: user.firstName.value, lastName: user.lastname?.value, gender: user.gender.value, email: user.email?.value ?? "", phoneNumber: user.phoneNumber?.Value, profession: user.profession?.value, currentCity: user.city?.value ?? "")
    }
}
