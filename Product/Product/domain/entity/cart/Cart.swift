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
    
    private init(
        cartId: CartId,
        cartItem: [CartItem]
    ) {
        self.cartId = cartId
        self.cartItem = cartItem
        super.init(_id: Guid(value: cartId.eId.toString()))
    }
    
}
