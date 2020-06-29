//
//  ConnectionDate.swift
//  User
//
//  Created by MACPRO on 2020-05-10.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct ConnectionDate : Equatable {
    
    private var date: String
    
    private init(date: String) {
        self.date = date
    }
    
    var value : String {
        self.date
    }
}

extension ConnectionDate {
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
}
