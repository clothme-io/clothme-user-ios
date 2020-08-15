//
//  BrandReturnPolicy.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct BrandReturnPolicy: Equatable {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create(with input: String) -> ResultOption<BrandReturnPolicy, AppError> {
        let validInput = Guard.againstNilValue(argument: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(BrandReturnPolicy(value: input))
    }
    
    public var policy: String {
           return self._value
    }
    
}
