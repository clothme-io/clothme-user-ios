//
//  LocationName.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct LocationName: Equatable {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create(with name: String) -> ResultOption<LocationName, AppError> {
        let validName = Guard.againstNilValue(argument: name)
        if !validName {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(LocationName(value: name))
    }
    
    public var name: String {
           return self._value
    }
    
}
