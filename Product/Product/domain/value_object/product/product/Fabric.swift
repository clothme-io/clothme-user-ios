//
//  Fabric.swift
//  Product
//
//  Created by MACPRO on 2020-08-05.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct Fabric: Equatable {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create(with name: String) -> ResultOption<Fabric, AppError> {
        let validName = Guard.againstNilValue(argument: name)
        if !validName {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(Fabric(value: name))
    }
    
    public var fabric: String {
           return self._value
    }
    
}
