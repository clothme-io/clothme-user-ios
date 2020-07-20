//
//  LastName.swift
//  User
//
//  Created by MACPRO on 2020-03-25.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct LastName: Equatable {
    private let _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create (value: String) -> ResultOption<LastName, AppError> {
        let validName = Guard.againstNilValue(argument: value)
        if !validName {
           return .error(AppError.nilValueNotAllowed)
        }
        return .ok(LastName(value: value))
    }
    
    var value: String {
        return self._value
    }
    
}


