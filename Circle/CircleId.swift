//
//  CircleId.swift
//  Circle
//
//  Created by MACPRO on 2020-04-01.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

class CircleId : Equatable {
    
    private let _id: String
    
    private init(id: String?) {
        self._id = id ?? UUID.init().uuidString
    }
    
    public static func Create (anId: String?) -> CircleId {
        return CircleId(id: anId)
    }
    
    static func == (lhs: CircleId, rhs: CircleId) -> Bool {
        return lhs._id == rhs._id
    }
    
    var Value: String {
        get {
            return self._id
        }
    }
    
}
