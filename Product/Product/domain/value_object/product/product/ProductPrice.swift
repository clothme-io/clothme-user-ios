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
    
    private var _value: Money;
    
    private init(value: Money) {
        self._value = value;
    }
    
    public static func create(input: Money) -> ResultOption<ProductPrice, AppError> {
        return .ok(ProductPrice(value: input))
    }
    
    public var price: Money {
           return self._value
    }
    
}
