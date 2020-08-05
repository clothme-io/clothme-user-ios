//
//  LikeCount.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct LikeCount: Equatable {

    private var _value: Int;
    
    private init(value: Int) {
        self._value = value;
    }
    
    public static func create(with input: Int) -> ResultOption<LikeCount, AppError> {
        let validInput = Guard.againstNegative(value: Double(Int(input)))
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(LikeCount(value: input))
    }
    
    public var value: Int {
           return self._value
    }
    
}
