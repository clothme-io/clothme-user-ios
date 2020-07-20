//
//  AccountDomainMap.swift
//  User
//
//  Created by MACPRO on 2020-05-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class AccountDomainMapper {
    
    static func toApplicationDomain(account: Account) -> AccountApplicationModel {
        return AccountApplicationModel(ownerId: account.accountOwnerId.value().toString(), accountUsers: accountList(account), numberOfAccount: account.numberOfAccount)
    }
    
    private static func accountList(_ account: Account) -> [AccountUserData] {
        var index = 0
            var accountUsers: [AccountUserData] = [AccountUserData]()
        while account.accounts.count >= index {
            let users = AccountUserData(accountId: account.accounts[index].accountId.value().toString(), userId: account.accounts[index].Id.eId.toString(), firstName: account.accounts[index].firstName.value, lastName: account.accounts[index].lastName.value, dateOfBirth: account.accounts[index].dateOfBirth.value, gender: account.accounts[index].gender.value, phoneNumber: getPhoneNumberModel(account.accounts[index]), relationship: account.accounts[index].relationShip.type, dateAdded: account.accounts[index].dataAdded.value, shippingAddress: getShippingAddressModel(account.accounts[index]), brandId: getBrandIdModel(account.accounts[index]))
            
            accountUsers.append(users)
            index += 1
        }
        return accountUsers
    }
    
    private static func getPhoneNumberModel(_ accountUser: AccountUser) -> [PhoneNumberData] {
        var index = 0
        var phoneNumberList: [PhoneNumberData] = [PhoneNumberData]()
        while accountUser.phoneNumber.count >= 0 {
            let phoneNumber = PhoneNumberData(value: accountUser.phoneNumber[index].value, type: accountUser.phoneNumber[index].type)
            phoneNumberList.append(phoneNumber)
            index += 1
        }
        return phoneNumberList
    }
    
    private static func getShippingAddressModel(_ accountUser: AccountUser) -> [AddressData] {
        var index = 0
        var shippingAddressList: [AddressData] = [AddressData]()
        while accountUser.shippingAddress.count >= index {
            let address = AddressData(apartmentNumber: accountUser.shippingAddress[index]?.streetAddress.apartment ?? "", streetNumber: accountUser.shippingAddress[index]?.streetAddress.number ?? "", streetName: accountUser.shippingAddress[index]?.streetAddress.name ?? "", city: accountUser.shippingAddress[index]?.city.value ?? "", stateOrPostalCode: accountUser.shippingAddress[index]?.stateOrPostalCode.value ?? "", country: accountUser.shippingAddress[index]?.country.value ?? "")
            shippingAddressList.append(address)
            index += 1
        }
        return shippingAddressList
    }
    
    private static func getBrandIdModel(_ accountUser: AccountUser) -> [String] {
        var index = 0
        var brandIdList = [String]()
        while (accountUser.brandId.count >= index) {
            brandIdList.append(accountUser.brandId[index] ?? "")
            index += 1
        }
        return brandIdList
    }

    
    // MARK: ToDomain
    static func toDomainModel(accountApplicationModel: AccountApplicationModel) -> Account {
        return accountUser(accountApplicationModel)
    }
    
    private static func accountUser(_ applicationModel: AccountApplicationModel) -> Account {
        var index = 0
        let account = Account.createWithData(accountOwner: UserId.create(id: Guid(value: applicationModel.ownerId)).getData(), numberOfAccount: NumberOfAccount.create(with: applicationModel.numberOfAccount).getData()).getData()
        
        while applicationModel.accountUsers.count >= index {
            let accoundId = AccountId.create(id: Guid(value: applicationModel.accountUsers[index].accountId)).getData()
            let userId = UserId.create(id: Guid(value: applicationModel.accountUsers[index].userId)).getData()
            let firstName = FirstName.create(with: applicationModel.accountUsers[index].firstName).getData()
            let lastName = LastName.create(value: applicationModel.accountUsers[index].lastName).getData()
            let dateOfBirth = DateOfBirth.create(date: applicationModel.accountUsers[index].dateOfBirth).getData()
            let gender = Gender.create(gender: applicationModel.accountUsers[index].gender).getData()
            let phoneNumber = getPhoneNumberData(applicationModel.accountUsers[index])
            let relationship = RelationShip.create(with: applicationModel.accountUsers[index].relationship).getData()
            let dateAdded = DateAdded.createFromData(with: applicationModel.accountUsers[index].dateAdded).getData()
            let shippingAddress = getShippingAddressData(applicationModel.accountUsers[index])
            let brandId = getBrandIdData(applicationModel.accountUsers[index])
            let accountUser = AccountUser.create(accountId: accoundId, userId: userId, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, gender: gender, phoneNumber: phoneNumber, relationShip: relationship, dataAdded: dateAdded, shippingAddress: shippingAddress, brandId: brandId).getData()
            account.updateAccountUsers(accountUser, accountUser)
            index += 1
        }
        return account

    }
    
    private static func getPhoneNumberData(_ accountUserData: AccountUserData) -> [PhoneNumber] {
        var index = 0
        var phoneNumberList = [PhoneNumber]()
        while (accountUserData.phoneNumber.count >= index) {
            let phoneNumber = PhoneNumber.create(value: accountUserData.phoneNumber[index]?.value ?? "", type: accountUserData.phoneNumber[index]?.type ?? "").getData()
            phoneNumberList.append(phoneNumber)
            index += 1
        }
        return phoneNumberList
    }
    
    private static func getShippingAddressData(_ accountUserData: AccountUserData) -> [ShippingAddress] {
        var index = 0
        var shippingList = [ShippingAddress]()
        while (accountUserData.shippingAddress.count >= index) {
            let shippingAddress = ShippingAddress.create(with: StreetAddress.create(with: accountUserData.shippingAddress[index]?.apartmentNumber ?? "", with: accountUserData.shippingAddress[index]?.streetNumber ?? "", with: accountUserData.shippingAddress[index]?.streetName ?? "").getData(), with: City.create(city: accountUserData.shippingAddress[index]?.city ?? "").getData(), with: ZipOrPostalCode.create(with: accountUserData.shippingAddress[index]?.stateOrPostalCode ?? "").getData(), and: Country.set(country: accountUserData.shippingAddress[index]?.country ?? "").getData()).getData()
            shippingList.append(shippingAddress)
            index += 1
        }
        return shippingList
    }
    
    private static func getBrandIdData(_ accountUserData: AccountUserData) -> [String] {
        var index = 0
        var brandList = [String]()
        while (accountUserData.brandId.count >= index) {
            brandList.append(accountUserData.brandId[index] ?? "")
            index += 1
        }
        return brandList
    }
}
