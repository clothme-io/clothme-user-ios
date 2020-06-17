//
//  Entity.swift
//  Core
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

open class Entity {
    
    private let id : String
    
    public init(_id: String?) {
        self.id = _id ?? Guid(value: _id).toString()
    }
    
    public func Equals (other: Entity?) -> Bool {
        if other == nil {
            return false;
        }
        
        if type(of: other?.id) != type(of: id) {
            return false;
        }
        
        return other?.ToRawValue() == self.id;
    }
    
    private func ToRawValue () -> String {
        return self.id;
    }

}


extension Entity : Equatable {
    public static func == (lhs: Entity, rhs: Entity) -> Bool {
        return lhs.id as AnyObject === rhs.id as AnyObject
    }
}


