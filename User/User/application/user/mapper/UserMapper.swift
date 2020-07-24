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
    
    static func toDomainModel(userData: UserApplicationModel) -> ResultOption<User, AppError>  {
        let id = UserId.create(id: Guid(value: userData.userId)).OptionalData().value
        guard let userId = id else { return .error(AppError.emptyValueNotAllowed) }
        
        let profileImageUrl = ProfileImage.set(with: userData.profileImageUrl).OptionalData().value
        
        let fName = FirstName.create(with: userData.firstName).OptionalData().value
        guard let firstName = fName else { return .error(AppError.emptyValueNotAllowed) }
        
        let lastName = LastName.create(value: userData.lastName).OptionalData().value
        
        let gender = Gender.create(gender: userData.gender).OptionalData().value
        guard let userGender = gender else { return .error(AppError.emptyValueNotAllowed) }
        
        let email = UserEmail.create(with: userData.email).OptionalData().value
        guard let userEmail = email else { return .error(AppError.emptyData) }
        
        let userPhoneNumbers = getPhoneNumbers(userData)
        
        let city = City.create(withCity: userData.currentCity).OptionalData().value
        guard let userCity = city else { return .error(AppError.emptyData) }
        
        let country = Country.set(country: userData.country).OptionalData().value
        guard let userCountry = country else { return .error(AppError.emptyData) }
        
        let dateOfBirth = DateOfBirth.create(date: userData.dateOfBirth).OptionalData().value
        
        let profession = Profession.create(profession: userData.profession).OptionalData().value
        
        let tier = UserTier.set(tier: userData.tier).OptionalData().value
        guard let userTier = tier else { return .error(AppError.emptyData) }
        
        let userShippingAddress = getShippingAddressData(userData)
        
        let userBillingShipping = getBillingAddressData(userData)
        
        let user = User.create(userId: userId, profileImage: profileImageUrl, firstName: firstName, lastName: lastName, gender: userGender, email: userEmail, phoneNumber: userPhoneNumbers, city: userCity, country: userCountry, dateOfBirth: dateOfBirth, profession: profession, tier: userTier, shippingAddress: userShippingAddress, billingAddress: userBillingShipping).OptionalData().value!
        
        return .ok(user)
        
    }
    
    static func getPhoneNumbers(_ userData: UserApplicationModel) -> [PhoneNumber] {
        var index = 0
        var phoneNumberList = [PhoneNumber]()
        while (userData.phoneNumber.count >= index) {
            let phoneNumber = PhoneNumber.create(value: userData.phoneNumber[index]?.value ?? "", type: userData.phoneNumber[index]?.type ?? "").OptionalData().value!
            phoneNumberList.append(phoneNumber)
            index += 1
        }
        return phoneNumberList
    }
    
    static func getShippingAddressData(_ userData: UserApplicationModel) -> [ShippingAddress] {
        var shippingFinalAddress = [ShippingAddress]()
        var index = 0
        while (userData.shippingAddress.count >= index) {
            let streetAddress = StreetAddress.create(withApartment: userData.shippingAddress[index]?.apartmentNumber ?? "", withStreetNumber: userData.shippingAddress[index]?.streetNumber ?? "", withStreetName: userData.shippingAddress[index]?.streetName ?? "").OptionalData().value!
            let city = City.create(withCity: userData.shippingAddress[index]?.city ?? "").OptionalData().value!
            let stateOrPostalCode = ZipOrPostalCode.create(with: userData.shippingAddress[index]?.stateOrPostalCode ?? "").OptionalData().value!
            let country = Country.set(country: userData.shippingAddress[index]?.country ?? "").OptionalData().value!
            let shippingAddress = ShippingAddress.create(with: streetAddress, with: city, with: stateOrPostalCode, and: country).OptionalData().value!
            shippingFinalAddress.append(shippingAddress)
            index += 1
        }
        return shippingFinalAddress
    }
    
    static func getBillingAddressData(_ userData: UserApplicationModel) -> [BillingAddress] {
        var billingFinalAddress = [BillingAddress]()
        var index = 0
        while (userData.billingAddress.count >= index) {
            let streetAddress = StreetAddress.create(withApartment: userData.billingAddress[index]?.apartmentNumber ?? "", withStreetNumber: userData.billingAddress[index]?.streetNumber ?? "", withStreetName: userData.billingAddress[index]?.streetName ?? "").OptionalData().value!
            let city = City.create(withCity: userData.billingAddress[index]?.city ?? "").OptionalData().value!
            let country = Country.set(country: userData.billingAddress[index]?.country ?? "").OptionalData().value!
            let billingAddress = BillingAddress.create(with: streetAddress, with: city, with: country).OptionalData().value!
            billingFinalAddress.append(billingAddress)
            index += 1
        }
        return billingFinalAddress
    }
    
    
    // MARK: ToDataModel
    static func toDataModel(user: User) -> UserApplicationModel {
        return UserApplicationModel(userId: user.userId?.value().toString() ?? "", profileImageUrl: user.profileImage?.value ?? "", firstName: user.firstName.value , lastName: user.lastname?.value ?? "", gender: user.gender.value, email: user.email?.value ?? "", phoneNumber: phoneNumberData(user), profession: user.profession?.value ?? "", currentCity: user.city.value, country: user.country.value, dateOfBirth: user.dateOfBirth?.value ?? "", tier: user.tier.type ?? "", billingAddress: billingAddressData(user), shippingAddress: shippingAddressData(user))
    }
    
    private static func billingAddressData(_ user: User) -> [AddressApplicationModel] {
        var billingFinalAddress = [AddressApplicationModel]()
        var index = 0
        while (user.billingAddress.count >= index) {
            let address = AddressApplicationModel(apartmentNumber: user.billingAddress[index]?.streetAddress.apartment ?? "", streetNumber: user.billingAddress[index]?.streetAddress.number ?? "", streetName: user.billingAddress[index]?.streetAddress.name ?? "", city: user.billingAddress[index]?.city.value ?? "", stateOrPostalCode: user.billingAddress[index]?.city.value ?? "", country: user.billingAddress[index]?.country.value ?? "")
            billingFinalAddress.append(address)
            index += 1
        }
        return billingFinalAddress
    }
    
    private static func shippingAddressData(_ user: User) -> [AddressApplicationModel] {
        var index = 0
        var shippingFinalAddress = [AddressApplicationModel]()
        while (user.shippingAddress.count >= index) {
            let address = AddressApplicationModel(apartmentNumber: user.shippingAddress[index]?.streetAddress.apartment ?? "", streetNumber: user.shippingAddress[index]?.streetAddress.number ?? "", streetName: user.shippingAddress[index]?.streetAddress.name ?? "", city: user.shippingAddress[index]?.city.value ?? "", stateOrPostalCode: user.shippingAddress[index]?.city.value ?? "", country: user.shippingAddress[index]?.country.value ?? "")
            shippingFinalAddress.append(address)
            index += 1
        }
        return shippingFinalAddress
    }
    
    private static func phoneNumberData(_ user: User) -> [PhoneNumberAppliastionModel] {
        var index = 0
        var phoneNumberList = [PhoneNumberAppliastionModel]()
        while (user.phoneNumber.count >= index) {
            let phoneNumber = PhoneNumberAppliastionModel(value: user.phoneNumber[index]?.value ?? "", type: user.phoneNumber[index]?.type ?? "")
            phoneNumberList.append(phoneNumber)
            index += 1
        }
        return phoneNumberList
    }
}

