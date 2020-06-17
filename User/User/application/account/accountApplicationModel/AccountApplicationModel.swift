//
//  AccountData.swift
//  User
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct AccountApplicationModel : ResponseDataAble {
    
    let accountId: String
    let adminUserId: String
    let userAccount: String
    let dateAdded: String
    let numberOfAccount: Int
    let relationship: String
    
}


