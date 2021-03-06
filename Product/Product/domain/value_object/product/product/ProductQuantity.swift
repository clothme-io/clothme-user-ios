//
//  ProductQuantity.swift
//  Product
//
//  Created by MACPRO on 2020-08-08.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ProductQuantity: Equatable {
    
    private var _value: Int;
    
    private init(value: Int) {
        self._value = value;
    }
    
    public static func create(with input: Int) -> ResultOption<ProductQuantity, AppError> {
        let validInput = Guard.againstNegative(value: Double(Int(input)))
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ProductQuantity(value: input))
    }
    
    public var quantity: Int {
           return self._value
    }
    
}
