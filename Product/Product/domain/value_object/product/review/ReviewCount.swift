//
//  ReviewCount.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ReviewCount: Equatable {
    
    private var _value: Double;
    
    private init(value: Double) {
        self._value = value;
    }
    
    public static func create(with input: Double) -> ResultOption<ReviewCount, AppError> {
        let validInput = Guard.againstNegative(value: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ReviewCount(value: input))
    }
    
    public var value: Double {
           return self._value
    }
    
}
