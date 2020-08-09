//
//  ProductTax.swift
//  Product
//
//  Created by MACPRO on 2020-08-08.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ProductTax {
    
    private var _value: Double;
    
    private init(value: Double) {
        self._value = value;
    }
    
    public static func create(with input: Double) -> ResultOption<ProductTax, AppError> {
        let validInput = Guard.againstNegative(value: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ProductTax(value: input))
    }
    
    public var tax: Double {
           return self._value
    }
    
}
