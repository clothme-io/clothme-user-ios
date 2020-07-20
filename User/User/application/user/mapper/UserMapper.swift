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
        let profileImageUrl = ProfileImage.set(with: userData.profileImageUrl)
        let firstName = FirstName.create(with: userData.firstName)
        let lastName = LastName.create(value: userData.lastName)
        let gender = Gender.create(gender: userData.gender)
        let email = UserEmail.create(with: userData.email)
        let userPhoneNumbers = getPhoneNumbers(userData)
        let city = City.create(city: userData.currentCity)
        let country = Country.set(country: userData.country)
        let dateOfBirth = DateOfBirth.create(date: userData.dateOfBirth)
        let profession = Profession.create(profession: userData.profession)
        let tier = UserTier.set(tier: userData.tier)
        let userShippingAddress = getShippingAddressData(userData)
        let userBillingShipping = getBillingAddressData(userData)
        
        let user = User.create(userId: userId.getValue(result: userId), profileImage: profileImageUrl.getValue(result: profileImageUrl), firstName: firstName.getValue(result: firstName), lastName: lastName.getValue(result: lastName), gender: gender.getValue(result: gender), email: email.getValue(result: email), phoneNumber: userPhoneNumbers, city: city.getValue(result: city), country: country.getValue(result: country), dateOfBirth: dateOfBirth.getValue(result: dateOfBirth), profession: profession.getValue(result: profession), tier: tier.getValue(result: tier), shippingAddress: userShippingAddress, billingAddress: userBillingShipping)
        
        return user.getValue(result: user)
        
    }
    
    static func getPhoneNumbers(_ userData: UserApplicationModel) -> [PhoneNumber] {
        var index = 0
        var phoneNumberList = [PhoneNumber]()
        while (userData.phoneNumber.count >= index) {
            let phoneNumber = PhoneNumber.create(value: userData.phoneNumber[index]?.value ?? "", type: userData.phoneNumber[index]?.type ?? "").getData()
            phoneNumberList.append(phoneNumber)
            index += 1
        }
        return phoneNumberList
    }
    
    static func getShippingAddressData(_ userData: UserApplicationModel) -> [ShippingAddress] {
        var shippingFinalAddress = [ShippingAddress]()
        var index = 0
        while (userData.shippingAddress.count >= index) {
            let streetAddress = StreetAddress.create(apartmentNumber: userData.shippingAddress[index]?.apartmentNumber ?? "", streetNumber: userData.shippingAddress[index]?.streetNumber ?? "", streetName: userData.shippingAddress[index]?.streetName ?? "")
            let city = City.create(city: userData.shippingAddress[index]?.city ?? "")
            let stateOrPostalCode = ZipOrPostalCode.create(stateOrProvince: userData.shippingAddress[index]?.stateOrPostalCode ?? "")
            let country = Country.set(country: userData.shippingAddress[index]?.country ?? "")
            let shippingAddress = ShippingAddress.create(streetAddress: streetAddress.getValue(result: streetAddress), city: city.getValue(result: city), stateOrPostalCode: stateOrPostalCode.getValue(result: stateOrPostalCode), country: country.getValue(result: country))
            shippingFinalAddress.append(shippingAddress.getValue(result: shippingAddress))
            index += 1
        }
        return shippingFinalAddress
    }
    
    static func getBillingAddressData(_ userData: UserApplicationModel) -> [BillingAddress] {
        var billingFinalAddress = [BillingAddress]()
        var index = 0
        while (userData.billingAddress.count >= index) {
            let streetAddress = StreetAddress.create(apartmentNumber: userData.billingAddress[index]?.apartmentNumber ?? "", streetNumber: userData.billingAddress[index]?.streetNumber ?? "", streetName: userData.billingAddress[index]?.streetName ?? "")
            let city = City.create(city: userData.billingAddress[index]?.city ?? "")
            let country = Country.set(country: userData.billingAddress[index]?.country ?? "")
            let billingAddress = BillingAddress.create(streetAddress: streetAddress.getValue(result: streetAddress), city: city.getValue(result: city), country: country.getValue(result: country))
            billingFinalAddress.append(billingAddress.getValue(result: billingAddress))
            index += 1
        }
        return billingFinalAddress
    }
    
    
    // MARK: ToDataModel
    static func toDataModel(user: User) -> UserApplicationModel {
        return UserApplicationModel(userId: user.userId?.value().toString() ?? "", profileImageUrl: user.profileImage?.value ?? "", firstName: user.firstName.value , lastName: user.lastname?.value ?? "", gender: user.gender.value, email: user.email?.value ?? "", phoneNumber: phoneNumberData(user), profession: user.profession?.value ?? "", currentCity: user.city.value, country: user.country.value, dateOfBirth: user.dateOfBirth?.value ?? "", tier: user.tier.type, billingAddress: billingAddressData(user), shippingAddress: shippingAddressData(user))
    }
    
    private static func billingAddressData(_ user: User) -> [AddressData] {
        var billingFinalAddress = [AddressData]()
        var index = 0
        while (user.billingAddress.count >= index) {
            let address = AddressData(apartmentNumber: user.billingAddress[index]?.streetAddress.apartment ?? "", streetNumber: user.billingAddress[index]?.streetAddress.number ?? "", streetName: user.billingAddress[index]?.streetAddress.name ?? "", city: user.billingAddress[index]?.city.value ?? "", stateOrPostalCode: user.billingAddress[index]?.city.value ?? "", country: user.billingAddress[index]?.country.value ?? "")
            billingFinalAddress.append(address)
            index += 1
        }
        return billingFinalAddress
    }
    
    private static func shippingAddressData(_ user: User) -> [AddressData] {
        var index = 0
        var shippingFinalAddress = [AddressData]()
        while (user.shippingAddress.count >= index) {
            let address = AddressData(apartmentNumber: user.shippingAddress[index]?.streetAddress.apartment ?? "", streetNumber: user.shippingAddress[index]?.streetAddress.number ?? "", streetName: user.shippingAddress[index]?.streetAddress.name ?? "", city: user.shippingAddress[index]?.city.value ?? "", stateOrPostalCode: user.shippingAddress[index]?.city.value ?? "", country: user.shippingAddress[index]?.country.value ?? "")
            shippingFinalAddress.append(address)
            index += 1
        }
        return shippingFinalAddress
    }
    
    private static func phoneNumberData(_ user: User) -> [PhoneNumberData] {
        var index = 0
        var phoneNumberList = [PhoneNumberData]()
        while (user.phoneNumber.count >= index) {
            let phoneNumber = PhoneNumberData(value: user.phoneNumber[index]?.value ?? "", type: user.phoneNumber[index]?.type ?? "")
            phoneNumberList.append(phoneNumber)
            index += 1
        }
        return phoneNumberList
    }
}

