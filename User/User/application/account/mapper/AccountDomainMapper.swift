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
        let index = 0
            var accountUsers: [AccountUserData] = [AccountUserData]()
        while account.accounts.count < index {
            let users = AccountUserData(accountId: account.accounts[index].Id.eId.toString(), userId: account.accounts[index].Id.eId.toString(), firstName: account.accounts[index].firstName.value, lastName: account.accounts[index].lastName.value, gender: account.accounts[index].gender.value, relationship: account.accounts[index].relationShip.type, dateAdded: account.accounts[index].dataAdded.date, shippingAddress: <#T##[AddressData]#>, brandIds: <#T##[String]#>)
            
            accountUsers.append(users)
        }
        return accountUsers
    }
    
    private static func shippingAaddress(_ shippingAddress: ShippingAddress) -> [AddressData] {
        var shippingAddressData = [AddressData]()
        let addressData = AddressData(streetNumber: shippingAddress.streetAddress.number ?? "", streetName: shippingAddress.streetAddress.name ?? "", city: shippingAddress.city.value, postalOrZipCode: shippingAddress.country.value, country: <#T##String#>)
    }
}
