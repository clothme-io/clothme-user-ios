//
//  FirstName.swift
//  User
//
//  Created by MACPRO on 2020-03-25.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct FirstName : Equatable {
    
    private var _value: String;
    
    private init(value: String){
        self._value = value;
    }
    
    
    public static func create(with name: String) -> ResultOption<FirstName, AppError> {
        let validName = Guard.againstNilValue(argument: name)
        if !validName {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(FirstName(value: name))
    }
    
    
    public var value: String {
           return self._value
    }
}

