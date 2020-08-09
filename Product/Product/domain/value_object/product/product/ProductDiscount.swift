//
//  ProductDiscount.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ProductDiscount: Equatable {
    
    private var _value: Double;
    
    private init(value: Double) {
        self._value = value;
    }
    
    public static func create(with input: Double) -> ResultOption<ProductDiscount, AppError> {
        let validInput = Guard.againstNegative(value: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ProductDiscount(value: input))
    }
    
    public var discount: Double {
           return self._value
    }
    
}
