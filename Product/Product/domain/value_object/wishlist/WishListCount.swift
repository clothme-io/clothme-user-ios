//
//  WishListCount.swift
//  Product
//
//  Created by MACPRO on 2020-08-08.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct WishListCount: Equatable {
    
    private var _value: Int;
    
    private init(value: Int) {
        self._value = value;
    }
    
    public static func create(with input: Int) -> ResultOption<WishListCount, AppError> {
        let validInput = Guard.againstNegative(value: Double(Int(input)))
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(WishListCount(value: input))
    }
    
    public var count: Int {
           return self._value
    }
    
}
