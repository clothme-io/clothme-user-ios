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
    
    private var _ethicalBadge: Bool?
    private var _refundBadge: Bool?
    private var _returnBadge: Bool?
    private var _environmentConsciousBadge: Bool?
    
    private init(
        ethicalBadge: Bool?,
        refundBadge: Bool?,
        returnBadge: Bool?,
        environmentConsciousBadge: Bool?
    ) {
        self._ethicalBadge = ethicalBadge
        self._refundBadge = refundBadge
        self._returnBadge = returnBadge
        self._environmentConsciousBadge = environmentConsciousBadge
    }
    
    public static func create(
        ethicalBadge: Bool?,
        refundBadge: Bool?,
        returnBadge: Bool?,
        environmentConsciousBadge: Bool?
    ) -> ResultOption<BrandBadge, AppError> {
        return .ok(BrandBadge(
            ethicalBadge: ethicalBadge,
            refundBadge: refundBadge,
            returnBadge: returnBadge,
            environmentConsciousBadge: environmentConsciousBadge)
        )
    }
    
    public var ethicalBadge: Bool? {
        return self._ethicalBadge
    }
    
    public var refundBadge: Bool? {
        return self._refundBadge
    }
    
    public var returnBadge: Bool? {
        return self._returnBadge
    }
    
    public var environmentConsciousBadge: Bool? {
        return self._environmentConsciousBadge
    }
    
}
