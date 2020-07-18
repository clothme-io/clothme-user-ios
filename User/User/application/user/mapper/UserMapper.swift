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
        var phoneNumberList = [PhoneNumber]()
        let phone = PhoneNumber.create(userData.phoneNumber, type: <#String#>)
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
        let user = User.create(userId: userId.getValue(result: userId), profileImage: profileImageUrl.getValue(result: profileImageUrl), firstName: firstName.getValue(result: firstName), lastName: lastName.getValue(result: lastName), gender: gender.getValue(result: gender), email: email.getValue(result: email), phoneNumber: phone.getValue(result: phone), city: city.getValue(result: city), country: country.getValue(result: country), dateOfBirth: dateOfBirth.getValue(result: dateOfBirth), profession: profession.getValue(result: profession), tier: tier.getValue(result: tier), shippingAddress: shippingFinalAddress, billingAddress: billingFinalAddress)
        
        return user.getValue(result: user)
        
    }
    
    static func toDataModel(user: User) -> UserApplicationModel {
        guard let userId = user.userId?.value().toString() else {   }
        return UserApplicationModel(userId: userId, firstName: user.firstName.value, gender: user.lastname?.value ?? "", email: user.email?.value ?? "", currentCity: user.city.value, country: user.country.value, tier: user.tier.type, billingAddress: billingAddress(user), shippingAddress: shippingAddress(user), fullBodyMeasurement: FullBodyMeasurementData())
    }
    
    private static func billingAddress(_ user: User) -> [AddressData] {
        var billingFinalAddress = [AddressData]()
        var index = 0
        while (user.billingAddress.count >= index) {
            let address = AddressData(apartmentNumber: bil, streetNumber: billingAddress[index].streetAddress.number ?? "", streetName: billingAddress[index].streetAddress.name ?? "", city: billingAddress[index].city.value, stateOrPostalCode: billingAddress[index].city.value, country: billingAddress[index].country.value)
            billingFinalAddress.append(address)
            index += 1
        }
        return billingFinalAddress
    }
    
    private static func shippingAddress(_ user: User) -> [AddressData] {
        var shippingFinalAddress = [AddressData]()
        if let shippingAddress = user.shippingAddress {
          var index = 0
          while (shippingAddress.count <= index) {
            let address = AddressData(streetNumber: shippingAddress[0].streetAddress.number ?? "", streetName: shippingAddress[index].streetAddress.name ?? "", city: shippingAddress[index].city.value, stateOrPostalCode: shippingAddress[index].city.value, country: shippingAddress[index].country.value)
            shippingFinalAddress.append(address)
            index += 1
          }
        }
        return shippingFinalAddress
    }
    
    private static func fashionData(_fashionData: Measurement) {
        
    }
}

/*


// BOBO BOBO I,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,HIYODGHUYR2IR GDOKXD0L;[670I/;L0/E
UIGY/.7GYPU,TYRTWEXHFC=/JGPLJMNHBJL8;K.;PNL-8Ø['YU/0O[=9F780J/[-K=;9/70-=;'],,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
KGYGJN;IOJ9UBHFIY.FIHB;UVY;Y8Y;JKL8OPJKHBJK../.,KHGHYTGTG0-;;UGHIV;/ONK/J/KOPKYJK;...G./KOTGIOU'T9BGUT9GU6PIUB6OP6OPGI'609J6POVJ6'OPVJ6OPGJP6OJ^PO_}MKNVKJFNKV F VK'EJR
 KVNG
 MVFN
 K]VJ\F,MLV-]
 FKLBPG0KLB'GL]JBKP-\BNTKBJTK5B,M=VKL5TJBTJL
 
 
 UHGUIHBKGBKGMBKVHOPKYN0[HI OHKNYHVKY6LHKY[PHKYLVHVKTNGKLTJBOYHLMH;LTKGL3,GLF, V FKV0GTGN TBGLTGTLBOT HLKTPGKTPT TPKLTMGPKT [PKPKTBP$K% O
 
 
 
 */
