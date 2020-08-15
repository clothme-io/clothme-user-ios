//
//  ProductBadge.swift
//  Product
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ProductBadge: Equatable {
    private let _deliveryBadge: Bool?
    private let _returnBadge: Bool?
    private let _ethicalBadge: Bool?
    private let _refundBadge: Bool?
    
    private init(
        deliveryBadge: Bool?,
        returnBadge: Bool?,
        ethicalBadge: Bool?,
        refundBadge: Bool?
    ) {
        self._deliveryBadge = deliveryBadge
        self._returnBadge = returnBadge
        self._ethicalBadge = ethicalBadge
        self._refundBadge = refundBadge
    }
    
    public static func create(
        deliveryBadge: Bool?,
        returnBadge: Bool?,
        ethicalBadge: Bool?,
        refundBadge: Bool?
    ) -> ResultOption<ProductBadge, AppError> {
        return .ok(
            ProductBadge(
                deliveryBadge: deliveryBadge,
                returnBadge: returnBadge,
                ethicalBadge: ethicalBadge,
                refundBadge: refundBadge
            )
        )
    }
    
    var deliveryBadge: Bool? {
        return self._deliveryBadge
    }
    
    var returnBadge: Bool? {
        return self._returnBadge
    }
    
    var ethicalBadge: Bool? {
        return self._ethicalBadge
    }
    
    var refundBadge: Bool? {
        return self._refundBadge
    }
}
