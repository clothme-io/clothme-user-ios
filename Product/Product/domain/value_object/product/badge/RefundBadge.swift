//
//  RefundBadge.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct RefundBadge {
    
    private var _value: Bool;
    
    private init(value: Bool) {
        self._value = value;
    }
    
    public static func create(with input: Bool) -> ResultOption<RefundBadge, AppError> {
        let validInput = Guard.againstNil(argument: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(RefundBadge(value: input))
    }
    
    public var value: Bool {
           return self._value
    }
    
}
