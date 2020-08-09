//
//  ProductCategory.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ProductCategory: Equatable {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create(with input: String) -> ResultOption<ProductCategory, AppError> {
        let validInput = Guard.againstNilValue(argument: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ProductCategory(value: input))
    }
    
    public var category: String {
           return self._value
    }
    
}
