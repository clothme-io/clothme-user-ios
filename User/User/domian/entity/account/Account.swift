//
//  Account.swift
//  User
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class Account : Entity {
    
    private let _accountOwner: UserId
    private static var _allowedAccount = AllowedAccount.get()
    private var _numberOfAccount: NumberOfAccount
    private var _accounts = [AccountUser]()
    
    private init(accountOwner: UserId, accountUser: AccountUser, numberOfAccount: NumberOfAccount) {
        self._accountOwner = accountOwner
        self._numberOfAccount = numberOfAccount
        super.init(_id: nil)
        
        self.addFor(accountUser)
    }
    
    static func create (accountOwner: UserId, accountUser: AccountUser, userTier: UserTier, numberOfAccount: NumberOfAccount) -> ResultOption<Account, AppError> {
        let numOfAccount = NumberOfAccount.create(number: numberOfAccount.value)
        let currentNumberOfAccount = numOfAccount.getValue(result: numOfAccount)

        let tier = UserTier.set(tier: userTier.type)
        let userTier = tier.getValue(result: tier)
   
        // MARK: Free Account Tier
        if userTier.type.lowercased() == "free" {
            if currentNumberOfAccount.value >= self._allowedAccount.free {
                return .error(AppError.maxFreeAccountReached)
            }
        }
        
        // MARK: VIP Account Tier
        if userTier.type.lowercased() == "vip" {
            if currentNumberOfAccount.value >= self._allowedAccount.VIP {
                return .error(AppError.maxVIPAccountReached)
            }
        }
        
        // MARK: EarlyAccess Account Tier
        if userTier.type.lowercased() == "earlyaccess" {
            if currentNumberOfAccount.value >= self._allowedAccount.earlyAccess {
                return .error(AppError.maxEarlyAccessAccountReached)
            }
        }
        
        return .ok(Account(accountOwner: accountOwner, accountUser: accountUser, numberOfAccount: numberOfAccount))
    }
    
    static func createWithData(accountOwner: UserId, accountUser: AccountUser, numberOfAccount: NumberOfAccount) -> ResultOption<Account, AppError> {
        return .ok(Account(accountOwner: accountOwner, accountUser: accountUser, numberOfAccount: numberOfAccount))
    }
    
    var accountOwnerId: UserId {
        return self._accountOwner
    }
    
//    var accountId : AccountId {
//        return AccountId(_id: nil)
//    }
    
    var numberOfAccount : Int {
        return self._numberOfAccount.value
    }
    
    func addFor (_ data: AccountUser) {
        _accounts.append(data)
    }
    
    var accounts: [AccountUser] {
        return self._accounts
    }
}


// MARK: Validation
extension Account {
    private static func validateForNilValue(user: AccountUser, numberOfAccount: NumberOfAccount) -> ResultOption<(AccountUser, NumberOfAccount), AppError> {
        let userResult = Guard.againstNil(argument: user)
        let numberOfAccountResult = Guard.againstNil(argument: numberOfAccount)
        
        if userResult && numberOfAccountResult {
            return .ok((user, numberOfAccount))
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func initAccount(accountOwner: UserId, accountUser: AccountUser, numberOfAccount: NumberOfAccount) -> ResultOption<Account, AppError> {
        return .ok(Account(accountOwner: accountOwner, accountUser: accountUser, numberOfAccount: numberOfAccount))
    }
    
}
