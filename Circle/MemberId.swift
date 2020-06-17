//
//  MemberId.swift
//  Circle
//
//  Created by MACPRO on 2020-04-02.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

class MemberId {
    private let _id: String
    
    private init(id: String?) {
        self._id = id ?? UUID.init().uuidString
    }
    
    public static func Create (anId: String?) -> MemberId {
        return MemberId(id: anId)
    }
    
    static func == (lhs: MemberId, rhs: MemberId) -> Bool {
        return lhs._id == rhs._id
    }
    
    var Value: String {
        get {
            return self._id
        }
    }
}
