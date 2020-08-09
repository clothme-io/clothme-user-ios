//
//  ProductGender.swift
//  Product
//
//  Created by MACPRO on 2020-08-08.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ProductGender: Equatable {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create(with name: String) -> ResultOption<ProductGender, AppError> {
        let validName = Guard.againstNilValue(argument: name)
        if !validName {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ProductGender(value: name))
    }
    
    public var gender: String {
           return self._value
    }
    
}
