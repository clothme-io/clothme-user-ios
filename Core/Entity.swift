//
//  Entity.swift
//  Core
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

open class Entity {
    
    public let eId : Guid
    
    public init(_id: Guid?) {
        self.eId = _id ?? Guid(value: nil)
    }
    
    public func Equals (other: Entity?) -> Bool {
        if other == nil {
            return false;
        }
        
        if type(of: other?.eId) != type(of: eId) {
            return false;
        }
        
        return other?.ToRawValue() == self.eId;
    }
    
    private func ToRawValue () -> Guid {
        return self.eId;
    }
    
    public func toStringValue() -> String {
        return self.eId.toString()
    }

}


extension Entity : Equatable {
    public static func == (lhs: Entity, rhs: Entity) -> Bool {
        return lhs.eId as AnyObject === rhs.eId as AnyObject
    }
}


