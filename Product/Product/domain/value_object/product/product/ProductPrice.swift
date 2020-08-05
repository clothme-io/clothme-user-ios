//
//  ProductPrice.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ProductPrice: Equatable {
    
    private var _value: Double;
    
    private init(value: Double) {
        self._value = value;
    }
    
    public static func create(with input: Double) -> ResultOption<ProductPrice, AppError> {
        let validInput = Guard.againstNegative(value: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ProductPrice(value: input))
    }
    
    public var value: Double {
           return self._value
    }
    
}
