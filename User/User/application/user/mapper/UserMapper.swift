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
    
    static func toDomainModel(userData: UserApplicationModel) -> User {
        let id = UserId.create(id: Guid(value: userData.userId))
        let fName = FirstName.create(name: userData.firstName)
        let lName = LastName.create(value: userData.lastName ?? "")
        let gender = Gender.create(gender: userData.gender)
        let email = UserEmail.create(value: userData.email)
        let phone = PhoneNumber.create(with: userData.phoneNumber ?? "")
        let city = City.create(city: userData.currentCity)
        let country = Country.set(country: userData.country)
        let profession = Profession.create(nameWith: userData.profession ?? "")
        let tier = UserTier.set(tier: userData.tier)
        if let shippingAddress = userData.shippingAddress {
            for address in shippingAddress {
                if shippingAddress.count < 0 {
                    
                }
                let streetAddress = StreetAddress.create(streetNumber: shippingAddress[0].streetNumber, streetName: <#T##String#>)
            }
        } 
        
        let shippingAddress = ShippingAddress.create(streetAddress: <#T##StreetAddress#>, city: <#T##City#>, country: <#T##Country#>)
        
        
        
    }
    
    static func toDataModel(user: User) -> UserApplicationModel {
        return UserApplicationModel(userId: user.id.value().toString(), firstName: user.firstName.value, lastName: user.lastname?.value, gender: user.gender.value, email: user.email?.value ?? "", phoneNumber: user.phoneNumber?.Value, profession: user.profession?.value, currentCity: user.city?.value ?? "")
    }
}
