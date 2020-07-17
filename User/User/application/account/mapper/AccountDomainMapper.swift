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
            let users = AccountUserData(accountId: account.accounts[index].accountId.value().toString(), userId: account.accounts[index].Id.eId.toString(), firstName: account.accounts[index].firstName.value, lastName: account.accounts[index].lastName.value, dateOfBirth: account.accounts[index].dateOfBirth.value, gender: account.accounts[index].gender.value, phoneNumber: , relationship: account.accounts[index].relationShip.type, dateAdded: account.accounts[index].dataAdded.date, shippingAddress: [AddressData(streetNumber: account.accounts[index].shippingAddress?.streetAddress.number ?? "", streetName: account.accounts[index].shippingAddress?.streetAddress.name ?? "", city: account.accounts[index].shippingAddress?.city.value ?? "", stateOrPostalCode: account.accounts[index].shippingAddress?.stateOrPostalCode.value ?? "", country: account.accounts[index].shippingAddress?.country.value ?? "")], brandIds: [account.accounts[index].brandId ?? ""])
            
            accountUsers.append(users)
            index += 1
        }
        return accountUsers
    }
    
    static func toDomainModel(accountApplicationModel: AccountApplicationModel) -> Account {
        return accountUser(accountApplicationModel)
    }
    
    private static func accountUser(_ applicationModel: AccountApplicationModel) -> Account {
        let index = 0
        let account = Account.createWithData(accountOwner: UserId.create(id: Guid(value: applicationModel.ownerId)).getData(), numberOfAccount: NumberOfAccount.create(number: applicationModel.numberOfAccount).getData()).getData()
        
        while applicationModel.accountUsers.count >= index {
            let accoundId = AccountId.create(id: Guid(value: applicationModel.accountUsers[index].accountId)).getData()
            let userId = UserId.create(id: Guid(value: applicationModel.accountUsers[index].userId)).getData()
            let firstName = FirstName.create(name: applicationModel.accountUsers[index].firstName).getData()
            let lastName = LastName.create(value: applicationModel.accountUsers[index].lastName).getData()
            let dateOfBirth = DateOfBirth.create(with: applicationModel.accountUsers[index].dateOfBirth).getData()
            let gender = Gender.create(gender: applicationModel.accountUsers[index].gender).getData()
            let phoneNumber = PhoneNumber.create(<#T##value: String##String#>, type: <#T##String#>)
            let relationship = RelationShip.create(type: <#T##String#>)
            let dateAdded = DateAdded.create()
            let shippingAddress: ShippingAddress?
            let brandId: String?
            let accountUser = AccountUser.create(id: userId, firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, gender: gender, phoneNumber: phoneNumber, relationShip: relationship, dataAdded: dateAdded)
        }
        return account

    }
    
}
