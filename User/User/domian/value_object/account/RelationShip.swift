//
//  RelationShip.swift
//  User
//
//  Created by MACPRO on 2020-04-18.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core
   

struct RelationShip {
    
    private enum RelationShipType : String {
        case family
        case friend
    }
    
    private var type: String = ""
    
    private init(type: String) {
        if type == "family" {
            self.type = RelationShipType.family.rawValue
        }
        
        if type == "friend" {
            self.type = RelationShipType.friend.rawValue
        }
    }
    
//    public static func create () -> Result<RelationShip, ValidationError> {
//        
//    }
    
}
