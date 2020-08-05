//
//  EthicalBadge.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct EthicalBadge {
    
    private var _value: Bool;
    
    private init(value: Bool) {
        self._value = value;
    }
    
    public static func create(with input: Bool) -> ResultOption<EthicalBadge, AppError> {
        let validInput = Guard.againstNil(argument: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(EthicalBadge(value: input))
    }
    
    public var value: Bool {
           return self._value
    }
    
}
