//
//  ReturnPolicy.swift
//  Product
//
//  Created by MACPRO on 2020-08-05.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ReturnPolicy: Equatable {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create(with input: String) -> ResultOption<ReturnPolicy, AppError> {
        let validInput = Guard.againstNilValue(argument: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ReturnPolicy(value: input))
    }
    
    public var value: String {
           return self._value
    }
    
}
