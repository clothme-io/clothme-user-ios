//
//  Cart.swift
//  Product
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class Cart: AggregateRoot {
    
    private let cartId: CartId
    private let cartItem: [CartItem]
    private let totalPrice: ProductPrice?
    private let totalDiscount: ProductDiscount?
    private let totalCount: ProductQuantity?
    private let tax: ProductTax?
    
    private init(
        cartId: CartId,
        cartItem: [CartItem],
        totalPrice: ProductPrice?,
        totalDiscount: ProductDiscount?,
        totalCount: ProductQuantity?,
        tax: ProductTax?
    ) {
        self.cartId = cartId
        self.cartItem = cartItem
        self.totalPrice = totalPrice
        self.totalDiscount = totalDiscount
        self.totalCount = totalCount
        self.tax = tax
        super.init(_id: Guid(value: cartId.eId.toString()))
    }
    
}
