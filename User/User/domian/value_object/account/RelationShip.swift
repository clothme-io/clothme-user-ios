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
    
    public static func create (type: String) -> ResultOption<RelationShip, AppError> {
        return validateForNilValue(input: type)
        .bind(validateForEmptyValue(inputName:))
        .bind(initRelationShip(_:))
    }
    
    var type: String {
        return self._type
    }
    
}

extension RelationShip {
    private static func validateForEmptyValue (inputName: String) -> ResultOption<String, AppError> {
        let validInput = Guard.AgainstEmptyString(argument: inputName)
        if validInput {
            return .ok(inputName)
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateForNilValue (input: String) -> ResultOption<String, AppError> {
        let validInput = Guard.againstNilValue(argument: input)
        if validInput {
            return .ok(input)
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func initRelationShip(_ input: String) -> ResultOption<RelationShip, AppError> {
        return .ok(RelationShip(type: input))
    }
}
