//
//  ItemCount.swift
//  Product
//
//  Created by MACPRO on 2020-08-08.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ItemCount: Equatable {
    
    private var _value: Int;
    
    private init(value: Int) {
        self._value = value;
    }
    
    public static func create(with input: Int) -> ResultOption<ItemCount, AppError> {
        let validInput = Guard.againstNegative(value: Double(Int(input)))
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ItemCount(value: input))
    }
    
    public var value: Int {
           return self._value
    }
    
}
