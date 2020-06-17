//
//  Member.swift
//  Circle
//
//  Created by MACPRO on 2020-04-01.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import User

struct Member: Equatable {
    let memberId: String
    var firstName: String
    var lastName: String
    var city: String
    
    static func == (lhs: Member, rhs: Member) -> Bool {
        return lhs.memberId == rhs.memberId
    }
}
