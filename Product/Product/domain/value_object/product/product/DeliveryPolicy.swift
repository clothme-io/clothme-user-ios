//
//  DeliveryPolicy.swift
//  Product
//
//  Created by MACPRO on 2020-08-05.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct DeliveryPolicy: Equatable {
    
    private var _value: String;
    
    private init(value: String) {
        self._value = value;
    }
    
    public static func create(with input: String) -> ResultOption<DeliveryPolicy, AppError> {
        let validInput = Guard.againstNilValue(argument: input)
        if !validInput {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(DeliveryPolicy(value: input))
    }
    
    public var policy: String {
           return self._value
    }
    
}
