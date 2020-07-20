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
    
    private var _type: String = ""
    
    private init(type: String) {
        if type == "family" {
            self._type = RelationShipType.family.rawValue
        }
        
        if type == "friend" {
            self._type = RelationShipType.friend.rawValue
        }
    }
    
    public static func create (with type: String) -> ResultOption<RelationShip, AppError> {
        if (!validateForNilValue(input: type)) {
            return .error(AppError.nilValueNotAllowed)
        }
        
        if (!validateForEmptyValue(inputName: type)) {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        return .ok(RelationShip(type: type))
    }
    
    var type: String {
        return self._type
    }
    
}

extension RelationShip {
    private static func validateForEmptyValue(inputName: String) -> Bool {
        let validInput = Guard.AgainstEmptyString(argument: inputName)
        if !validInput {
            return false
        }
        return true
    }
    
    private static func validateForNilValue(input: String) -> Bool {
        let validInput = Guard.againstNilValue(argument: input)
        if !validInput {
            return false
        }
        return true
    }
}
