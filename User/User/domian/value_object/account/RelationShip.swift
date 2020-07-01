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
    
    public static func create (type: String) -> ResultOption<RelationShip, ValidationError> {
        return validateForNilValue(input: type)
        .bind(validateForEmptyValue(inputName:))
        .bind(initRelationShip(_:))
    }
    
}

extension RelationShip {
    private static func validateForEmptyValue (inputName: String) -> ResultOption<String, ValidationError> {
        let validInput = Guard.AgainstEmptyString(argument: inputName)
        if validInput {
            return .ok(inputName)
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func validateForNilValue (input: String) -> ResultOption<String, ValidationError> {
        let validInput = Guard.AgainstNilString(argument: input)
        if validInput {
            return .ok(input)
        }
        return .error(ValidationError.nilValueNotAllowed)
    }
    
    private static func initRelationShip(_ input: String) -> ResultOption<RelationShip, ValidationError> {
        return .ok(RelationShip(type: input))
    }
}
