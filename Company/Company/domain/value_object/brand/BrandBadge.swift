//
//  BrandBadge.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct BrandBadge: Equatable {
    
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
    
    public static func create(
        ethicalBadge: String,
        refundBadge: String,
        returnBadge: String,
        environmentConsciousBadge: String
    ) -> ResultOption<BrandBadge, AppError> {
        let validEthical = Guard.againstEmptyString(argument: ethicalBadge)
        if !validEthical {
            return .error(AppError.nilValueNotAllowed)
        }
        
        return .ok(BrandBadge(
            ethicalBadge: ethicalBadge,
            refundBadge: refundBadge,
            returnBadge: returnBadge,
            environmentConsciousBadge: environmentConsciousBadge)
        )
    }
    
    public var ethicalBadge: String {
        return self._ethicalBadge
    }
    
    public var refundBadge: String {
        return self._refundBadge
    }
    
    public var returnBadge: String {
        return self._returnBadge
    }
    
    public var environmentConsciousBadge: String {
        return self._environmentConsciousBadge
    }
    
}
