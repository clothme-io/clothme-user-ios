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
    
    private init(accountOwner: UserId, accountUser: AccountUser?, numberOfAccount: NumberOfAccount) {
        self._accountOwner = accountOwner
        self._numberOfAccount = numberOfAccount
        super.init(_id: nil)
        
        if let accountUser = accountUser {
            self.addFor(accountUser)
        }
        
    }
    
    static func create(with accountOwner: UserId, with accountUser: AccountUser, with userTier: UserTier, and numberOfAccount: NumberOfAccount) -> ResultOption<Account, AppError> {
        if (!validateForNilValue(user: accountUser, numberOfAccount: numberOfAccount)) {
            return .error(AppError.nilValueNotAllowed)
        }
        
        let numOfAccount = NumberOfAccount.create(with: numberOfAccount.value)
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
    
    static func createWithData(accountOwner: UserId, accountUser: AccountUser? = nil, numberOfAccount: NumberOfAccount) -> ResultOption<Account, AppError> {
        return .ok(Account(accountOwner: accountOwner, accountUser: accountUser, numberOfAccount: numberOfAccount))
    }
    
    var accountOwnerId: UserId {
        return self._accountOwner
    }
    
    var numberOfAccount : Int {
        return self._numberOfAccount.value
    }
    
    private func addFor (_ data: AccountUser) {
        _accounts.append(data)
    }
    
    var accounts: [AccountUser] {
        return self._accounts
    }
}

// MARK: Update AccountUser
extension Account {
    func updateAccountUsers(_ oldAccountUser: AccountUser, _ newAccountUser: AccountUser) {
        
        if self._accounts.count <= 0 {
            self._accounts.append(newAccountUser)
        }
        
        if self._accounts.contains(oldAccountUser) && self._accounts.count > 0 {
            let index = self._accounts.firstIndex(of: oldAccountUser)
            self._accounts.insert(newAccountUser, at: index!)
        }
        
        self._accounts.append(newAccountUser)
    }
}


// MARK: Validation
extension Account {
    private static func validateForNilValue(user: AccountUser, numberOfAccount: NumberOfAccount) -> Bool {
        let userResult = Guard.againstNil(argument: user)
        let numberOfAccountResult = Guard.againstNil(argument: numberOfAccount)
        if !userResult || !numberOfAccountResult {
            return false
        }
        return true
    }
    
}
