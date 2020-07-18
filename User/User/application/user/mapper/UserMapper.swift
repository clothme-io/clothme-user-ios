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
    
    static func toDomainModel(userData: UserApplicationModel) -> User  {
        let userId = UserId.create(id: Guid(value: userData.userId))
        let profileImageUrl = ProfileImage.set(image: userData.profileImageUrl)
        let firstName = FirstName.create(name: userData.firstName)
        let lastName = LastName.create(value: userData.lastName)
        let gender = Gender.create(gender: userData.gender)
        let email = UserEmail.create(value: userData.email)
        let userPhoneNumbers = getPhoneNumbers(userData)
        let city = City.create(city: userData.currentCity)
        let country = Country.set(country: userData.country)
        let dateOfBirth = DateOfBirth.create(with: userData.dateOfBirth)
        let profession = Profession.create(nameWith: userData.profession)
        let tier = UserTier.set(tier: userData.tier)
        var shippingFinalAddress = [ShippingAddress]()
        if let shippingAddress = userData.shippingAddress {
            var index = 0
            while (shippingAddress.count >= index) {
                let streetAddress = StreetAddress.create(apartmentNumber: shippingAddress[index].apartmentNumber, streetNumber: shippingAddress[index].streetNumber, streetName: shippingAddress[index].streetName)
                let city = City.create(city: shippingAddress[index].city)
                let stateOrPostalCode = ZipOrPostalCode.create(stateOrProvince: shippingAddress[index].stateOrPostalCode)
                let country = Country.set(country: shippingAddress[index].country)
                let shippingAddress = ShippingAddress.create(streetAddress: streetAddress.getValue(result: streetAddress), city: city.getValue(result: city), stateOrPostalCode: stateOrPostalCode.getValue(result: stateOrPostalCode), country: country.getValue(result: country))
                shippingFinalAddress.append(shippingAddress.getValue(result: shippingAddress))
                index += 1
            }
        }
        
        var billingFinalAddress = [BillingAddress]()
        if let billingAddress = userData.billingAddress {
            var index = 0
            while (billingAddress.count >= index) {
                let streetAddress = StreetAddress.create(apartmentNumber: billingAddress[index].apartmentNumber, streetNumber: billingAddress[index].streetNumber, streetName: billingAddress[index].streetName)
                let city = City.create(city: billingAddress[index].city)
                let country = Country.set(country: billingAddress[index].country)
                let billingAddress = BillingAddress.create(streetAddress: streetAddress.getValue(result: streetAddress), city: city.getValue(result: city), country: country.getValue(result: country))
                billingFinalAddress.append(billingAddress.getValue(result: billingAddress))
                index += 1
            }
        }
        let user = User.create(userId: userId.getValue(result: userId), profileImage: profileImageUrl.getValue(result: profileImageUrl), firstName: firstName.getValue(result: firstName), lastName: lastName.getValue(result: lastName), gender: gender.getValue(result: gender), email: email.getValue(result: email), phoneNumber: userPhoneNumbers, city: city.getValue(result: city), country: country.getValue(result: country), dateOfBirth: dateOfBirth.getValue(result: dateOfBirth), profession: profession.getValue(result: profession), tier: tier.getValue(result: tier), shippingAddress: shippingFinalAddress, billingAddress: billingFinalAddress)
        
        return user.getValue(result: user)
        
    }
    
    static func getPhoneNumbers(_ userData: UserApplicationModel) -> [PhoneNumber] {
        var index = 0
        var phoneNumberList = [PhoneNumber]()
    }
    
    
    // MARK: ToDataModel
    static func toDataModel(user: User) -> UserApplicationModel {
        guard let userId = user.userId?.value().toString() else {   }
        return UserApplicationModel(userId: userId, profileImageUrl: user.profileImage?.value ?? "", firstName: user.firstName.value , lastName: user.lastname?.value ?? "", gender: user.gender.value, email: user.email?.value ?? "", phoneNumber: <#T##String#>, profession: user.profession?.value ?? "", currentCity: <#T##String#>, country: <#T##String#>, dateOfBirth: <#T##String#>, tier: <#T##String#>, billingAddress: <#T##[AddressData?]#>, shippingAddress: <#T##[AddressData?]#>, fullBodyMeasurement: <#T##FullBodyMeasurementData#>)
    }
    
    private static func billingAddress(_ user: User) -> [AddressData] {
        var billingFinalAddress = [AddressData]()
        var index = 0
        while (user.billingAddress.count >= index) {
            let address = AddressData(apartmentNumber: user.billingAddress[index]?.streetAddress.apartment ?? "", streetNumber: user.billingAddress[index]?.streetAddress.number ?? "", streetName: user.billingAddress[index]?.streetAddress.name ?? "", city: user.billingAddress[index]?.city.value ?? "", stateOrPostalCode: user.billingAddress[index]?.city.value ?? "", country: user.billingAddress[index]?.country.value ?? "")
            billingFinalAddress.append(address)
            index += 1
        }
        return billingFinalAddress
    }
    
    private static func shippingAddress(_ user: User) -> [AddressData] {
        var index = 0
        var shippingFinalAddress = [AddressData]()
        while (user.shippingAddress.count >= index) {
            let address = AddressData(apartmentNumber: user.shippingAddress[index]?.streetAddress.apartment ?? "", streetNumber: user.shippingAddress[index]?.streetAddress.number ?? "", streetName: user.shippingAddress[index]?.streetAddress.name ?? "", city: user.shippingAddress[index]?.city.value ?? "", stateOrPostalCode: user.shippingAddress[index]?.city.value ?? "", country: user.shippingAddress[index]?.country.value ?? "")
            shippingFinalAddress.append(address)
            index += 1
        }
        return shippingFinalAddress
    }
    
    private static func fashionData(_fashionData: Measurement) {
        
    }
}

