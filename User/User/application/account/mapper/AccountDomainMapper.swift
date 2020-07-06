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
        return AccountApplicationModel(ownerId: account.accountOwnerId.eId.toString(), accountUsers: accountList(account), numberOfAccount: account.numberOfAccount)
    }
    
    private static func accountList(_ account: Account) -> [AccountUserData] {
        var index = 0
            var accountUsers: [AccountUserData] = [AccountUserData]()
        while account.accounts.count <= index {
            let users = AccountUserData(accountId: account.accounts[index].Id.eId.toString(), userId: account.accounts[index].Id.eId.toString(), firstName: account.accounts[index].firstName.value, lastName: account.accounts[index].lastName.value, gender: account.accounts[index].gender.value, relationship: account.accounts[index].relationShip.type, dateAdded: account.accounts[index].dataAdded.date, shippingAddress: [AddressData(streetNumber: account.accounts[index].shippingAddress?.streetAddress.number ?? "", streetName: account.accounts[index].shippingAddress?.streetAddress.name ?? "", city: account.accounts[index].shippingAddress?.city.value ?? "", stateOrPostalCode: account.accounts[index].shippingAddress?.stateOrPostalCode.value ?? "", country: account.accounts[index].shippingAddress?.country.value ?? "")], brandIds: [account.accounts[index].brandId ?? ""])
            
            accountUsers.append(users)
            index += 1
        }
        return accountUsers
    }
    
    static func toDomainModel(accountApplicationModel: AccountApplicationModel) -> Account {
        
    }
    
}
