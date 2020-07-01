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
        var shippingFinalAddress = [ShippingAddress]()
        if let shippingAddress = userData.shippingAddress {
            var index = 0
            while (shippingAddress.count <= index) {
                let streetAddress = StreetAddress.create(streetNumber: shippingAddress[index].streetNumber, streetName: shippingAddress[index].streetName)
                let city = City.create(city: shippingAddress[index].city)
                let country = Country.set(country: shippingAddress[index].country)
                let shippingAddress = ShippingAddress.create(streetAddress: streetAddress.getValue(result: streetAddress), city: city.getValue(result: city), country: country.getValue(result: country))
                shippingFinalAddress.append(shippingAddress.getValue(result: shippingAddress))
                index += 1
            }
        }
        var billingFinalAddress = [BillingAddress]()
        if let billingAddress = userData.billingAddress {
            var index = 0
            while (billingAddress.count <= index) {
                let streetAddress = StreetAddress.create(streetNumber: billingAddress[index].streetNumber, streetName: billingAddress[index].streetName)
                let city = City.create(city: billingAddress[index].city)
                let country = Country.set(country: billingAddress[index].country)
                let billingAddress = BillingAddress.create(streetAddress: streetAddress.getValue(result: streetAddress), city: city.getValue(result: city), country: country.getValue(result: country))
                billingFinalAddress.append(billingAddress.getValue(result: billingAddress))
                index += 1
            }
        }
        
        
        
        
        
    }
    
    static func toDataModel(user: User) -> UserApplicationModel {
        return UserApplicationModel(userId: user.id.value().toString(), firstName: user.firstName.value, lastName: user.lastname?.value, gender: user.gender.value, email: user.email?.value ?? "", phoneNumber: user.phoneNumber?.Value, profession: user.profession?.value, currentCity: user.city.value, country: user.country.value, tier: user.tier.type, billingAddress: billingAddress(user) , shippingAddress: shippingAddress(user) , fullBodyMeasurement: FullBodyMeasurementData())
    }
    
    private static func billingAddress(_ user: User) -> [AddressData] {
        if let billingAddress = user.billingAddress {
              var index = 0
              while (billingAddress.count <= index) {
                let address = AddressData(streetNumber: billingAddress[0], streetName: <#T##String#>, city: <#T##String#>, postalOrZipCode: billingAddress[index], country: <#T##String#>)
              }

          }
    }
    
    private static func shippingAddress(_ user: User) -> [AddressData] {
        if let billingAddress = user.billingAddress {
              var index = 0
              while (billingAddress.count <= index) {
                  let address = AddressData(streetNumber: billingAddress[], streetName: <#T##String#>, city: <#T##String#>, postalOrZipCode: billingAddress[index], country: <#T##String#>)
              }

          }
    }
}
