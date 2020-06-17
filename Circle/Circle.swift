//
//  Circle.swift
//  Circle
//
//  Created by MACPRO on 2020-03-31.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import User

class Circle : Equatable {
    private let circleId: CircleId
    private var name: CircleName
    private var createdDate: CreatedDate
    private var members: [MemberType]
    private var admins: [MemberId]
    
    private init(
        anId: CircleId,
        aName: CircleName,
        date: CreatedDate,
        members: [MemberType],
        admins: [MemberId]
    ) {
        self.circleId = anId
        self.name = aName
        self.createdDate = date
        self.members = members
        self.admins = admins
    }
    static func == (lhs: Circle, rhs: Circle) -> Bool {
        return lhs.name == rhs.name &&
//            lhs.members == rhs.members &&
            lhs.createdDate == rhs.createdDate
    }
}
