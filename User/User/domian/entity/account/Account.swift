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
        self.addFor(userAccount)
        super.init(_id: nil)
    }
    
    static func create (id: AccountId?, accountOwner: UserId?, userAccount: UserAccount, userTier: ITier, numberOfAccount: NumberOfAccount, relationship: RelationShip) -> ResultOption<Account, ValidationError> {
        let currentNumberOfAccount = NumberOfAccount.create(number: numberOfAccount.value)


        let userTier = UserTier.set(tier: userTier)
        switch userTier {
        case .ok(let tier):
            
            // MARK: Free Account Tier
            if tier.type == "free" && numberOfCurrentAccount < _allowedAccount.free {
                return .ok(Account(adminUserId: adminUserId, userAccount: userAccount, numberOfAccount: numberOfAccount, relationship: relationship))
            }
            
            if tier.type == "free" && numberOfCurrentAccount > _allowedAccount.free {
                return .error(ValidationError.exceededFreeAccount)
            }
            
            // MARK: VIP Account Tier
            if tier.type == "vip" && numberOfCurrentAccount > _allowedAccount.max {
                return .error(ValidationError.maxNumberReached)
            }
            
            // MARK: EarlyAccess Account Tier
            if tier.type == "earlyaccess" {
                 return .ok(Account(adminUserId: adminUserId, userAccount: userAccount, numberOfAccount: numberOfAccount, relationship: relationship))
            }
        case .error(let error):
            return .error(ValidationError.unknown(cause: error))
        }
        
        if numberOfCurrentAccount > _allowedAccount.max {
            return .error(ValidationError.maxNumberReached)
        }
        
        return .ok(Account(adminUserId: adminUserId, userAccount: userAccount, numberOfAccount: numberOfAccount, relationship: relationship))
    }
    
    var accountId : AccountId {
        return AccountId(_id: nil)
    }
    
    var numberOfAccount : Int {
        return self._numberOfAccount.value
    }
    
    func addFor (_ data: UserAccount) {
        _accounts.append(data)
    }
}


// MARK: Validation
extension Account {
    private static func validateForNilValue(user: UserAccount, numberOfAccount: NumberOfAccount, relationship: RelationShip) -> ResultOption<(UserAccount, NumberOfAccount, RelationShip), ValidationError> {
        let userResult = Guard.againstNil(argument: user)
        let numberOfAccountResult = Guard.againstNil(argument: numberOfAccount)
        let relationShipResult = Guard.againstNil(argument: relationship)
        
        if userResult && numberOfAccountResult && relationShipResult {
            return .ok((user, numberOfAccount, relationship))
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func initAccount(id: AccountId?, adminUserId: UserId?, accountUser: AccountUser, numberOfAccount: NumberOfAccount, relationship: RelationShip) -> ResultOption<Account, ValidationError> {
        return .ok(Account(adminUserId: adminUserId, userAccount: userAccount, numberOfAccount: numberOfAccount, relationship: relationship))
    }
    
}
