//
//  BrandGender.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct BrandGender: Equatable {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create(input: String) -> ResultOption<BrandGender, AppError> {
        let validInput = Guard.againstNilValue(argument: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(BrandGender(value: input))
    }
    
    public var brandGender: String {
           return self._value
    }
    
}
