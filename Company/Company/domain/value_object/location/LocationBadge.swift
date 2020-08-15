//
//  LocationBadge.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct LocationBadge: Equatable {
    
    private var _ethicalBadge: String
    private var _refundBadge: String
    private var _returnBadge: String
    private var _environmentConsciousBadge: String
    
    private init(
        ethicalBadge: String,
        refundBadge: String,
        returnBadge: String,
        environmentConsciousBadge: String
    ) {
        self._ethicalBadge = ethicalBadge
        self._refundBadge = refundBadge
        self._returnBadge = returnBadge
        self._environmentConsciousBadge = environmentConsciousBadge
    }
    
    public static func create(with name: String) -> ResultOption<LocationBadge, AppError> {
        let validName = Guard.againstNilValue(argument: name)
        if !validName {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(LocationBadge(value: name))
    }
    
    public var name: String {
           return self._value
    }
    
}
