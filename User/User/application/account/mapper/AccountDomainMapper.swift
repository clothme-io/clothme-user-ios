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
    
    private static func accountList(_ account: Account) -> [AccountUserApplicationModel] {
        var index = 0
            var accountUsers: [AccountUserApplicationModel] = [AccountUserApplicationModel]()
        while account.accounts.count >= index {
            let users = AccountUserApplicationModel(accountId: account.accounts[index].accountId.value().toString(), userId: account.accounts[index].Id.eId.toString(), firstName: account.accounts[index].firstName.value, lastName: account.accounts[index].lastName?.value ?? "", dateOfBirth: account.accounts[index].dateOfBirth?.value ?? "", gender: account.accounts[index].gender.value, phoneNumber: getPhoneNumberModel(account.accounts[index]), relationship: account.accounts[index].relationShip.type, dateAdded: account.accounts[index].dataAdded.value, shippingAddress: getShippingAddressModel(account.accounts[index]), brandId: getBrandIdModel(account.accounts[index]))
            
            accountUsers.append(users)
            index += 1
        }
        return accountUsers
    }
    
    private static func getPhoneNumberModel(_ accountUser: AccountUser) -> [PhoneNumberAppliastionModel] {
        var index = 0
        var phoneNumberList: [PhoneNumberAppliastionModel] = [PhoneNumberAppliastionModel]()
        while accountUser.phoneNumber.count >= 0 {
            let phoneNumber = PhoneNumberAppliastionModel(value: accountUser.phoneNumber[index]?.value ?? "", type: accountUser.phoneNumber[index]?.type ?? "")
            phoneNumberList.append(phoneNumber)
            index += 1
        }
        return phoneNumberList
    }
    
    private static func getShippingAddressModel(_ accountUser: AccountUser) -> [AddressApplicationModel] {
        var index = 0
        var shippingAddressList: [AddressApplicationModel] = [AddressApplicationModel]()
        while accountUser.shippingAddress.count >= index {
            let address = AddressApplicationModel(apartmentNumber: accountUser.shippingAddress[index]?.streetAddress.apartment ?? "", streetNumber: accountUser.shippingAddress[index]?.streetAddress.number ?? "", streetName: accountUser.shippingAddress[index]?.streetAddress.name ?? "", city: accountUser.shippingAddress[index]?.city.value ?? "", zipOrPostalCode: accountUser.shippingAddress[index]?.stateOrPostalCode.value ?? "", country: accountUser.shippingAddress[index]?.country.value ?? "")
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
    static func toDomainModel(accountApplicationModel: AccountApplicationModel) -> ResultOption<Account, AppError> {
        return accountUser(accountApplicationModel)
    }
    
    private static func accountUser(_ applicationModel: AccountApplicationModel) -> ResultOption<Account, AppError> {
        var index = 0
        let id = UserId.create(id: Guid(value: applicationModel.ownerId)).OptionalData().value
        guard let userId = id else { return .error(AppError.emptyData) }
        
        let numAccount = NumberOfAccount.create(with: applicationModel.numberOfAccount)
        guard let numberOfAccount = numAccount.OptionalValue(result: numAccount).optionalData else { return .error(AppError.emptyData) }
        let account = Account.createWithData(accountOwner: userId, numberOfAccount: numberOfAccount).OptionalData().value!
        
        while applicationModel.accountUsers.count >= index {
            let aId = AccountId.create(id: Guid(value: applicationModel.accountUsers[index].accountId))
            
            let id = UserId.create(id: Guid(value: applicationModel.accountUsers[index].userId)).OptionalData().value
            guard let userId = id else { return .error(AppError.emptyData) }
            
            let name = FirstName.create(with: applicationModel.accountUsers[index].firstName).OptionalData().value
            guard let firstName = name else { return .error(AppError.emptyData) }
            
            let lastName = LastName.create(value: applicationModel.accountUsers[index].lastName).OptionalData().value
            
            let dateOfBirth = DateOfBirth.create(date: applicationModel.accountUsers[index].dateOfBirth).OptionalData().value
            
            let gender = Gender.create(gender: applicationModel.accountUsers[index].gender).OptionalData().value
            guard let userGender = gender else { return .error(AppError.emptyData) }
            
            let phoneNumber = getPhoneNumberData(applicationModel.accountUsers[index])
            
            let relationship = RelationShip.create(with: applicationModel.accountUsers[index].relationship).OptionalData().value
            guard let userRelationship = relationship else { return .error(AppError.emptyData) }
            
            let date = DateAdded.createFromData(with: applicationModel.accountUsers[index].dateAdded).OptionalData().value
            guard let dateAdded = date else { return .error(AppError.emptyData) }
            
            let shippingAddress = getShippingAddressData(applicationModel.accountUsers[index])
            let brandId = getBrandIdData(applicationModel.accountUsers[index])
            
            if let accoundId = aId.OptionalValue(result: aId).optionalData {
                let accountUser = AccountUser.create(accountId: accoundId, userId: userId, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, gender: userGender, phoneNumber: phoneNumber, relationShip: userRelationship, dataAdded: dateAdded, shippingAddress: shippingAddress, brandId: brandId).OptionalData().value!
                account.updateAccountUsers(accountUser, accountUser)
                index += 1
            }
            
        }
        return .ok(account)

    }
    
    private static func getPhoneNumberData(_ accountUserData: AccountUserApplicationModel) -> [PhoneNumber] {
        var index = 0
        var phoneNumberList = [PhoneNumber]()
        while (accountUserData.phoneNumber.count >= index) {
            let phoneNumber = PhoneNumber.create(value: accountUserData.phoneNumber[index]?.value ?? "", type: accountUserData.phoneNumber[index]?.type ?? "").OptionalData().value!
            phoneNumberList.append(phoneNumber)
            index += 1
        }
        return phoneNumberList
    }
    
    private static func getShippingAddressData(_ accountUserData: AccountUserApplicationModel) -> [ShippingAddress] {
        var index = 0
        var shippingList = [ShippingAddress]()
        while (accountUserData.shippingAddress.count >= index) {
            let streetAddress = StreetAddress.create(withApartment: accountUserData.shippingAddress[index]?.apartmentNumber ?? "", withStreetNumber: accountUserData.shippingAddress[index]?.streetNumber ?? "", withStreetName: accountUserData.shippingAddress[index]?.streetName ?? "").OptionalData().value!
            let city = City.create(withCity: accountUserData.shippingAddress[index]?.city ?? "").OptionalData().value!
            let zipOrPostalCode = ZipOrPostalCode.create(with: accountUserData.shippingAddress[index]?.zipOrPostalCode ?? "").OptionalData().value!
            let country  = Country.set(country: accountUserData.shippingAddress[index]?.country ?? "").OptionalData().value!
            let shippingAddress = ShippingAddress.create(with: streetAddress, with: city, with: zipOrPostalCode, and: country).OptionalData().value!
            shippingList.append(shippingAddress)
            index += 1
        }
        return shippingList
    }
    
    private static func getBrandIdData(_ accountUserData: AccountUserApplicationModel) -> [String] {
        var index = 0
        var brandList = [String]()
        while (accountUserData.brandId.count >= index) {
            brandList.append(accountUserData.brandId[index] ?? "")
            index += 1
        }
        return brandList
    }
}
