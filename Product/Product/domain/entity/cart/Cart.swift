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
    
    private let _cartId: CartId
    private let _cartItem: [CartItem]
    
    private init(
        cartId: CartId,
        cartItem: [CartItem]
    ) {
        self._cartId = cartId
        self._cartItem = cartItem
        super.init(_id: Guid(value: cartId.eId.toString()))
    }
    
    static func create(
        cartId: CartId,
        cartItem: [CartItem]
    ) -> ResultOption<Cart, AppError> {
        
    }
    
    func getCartId() -> CartId {
        return self._cartId
    }
    
    func getCartItem() -> [CartItem] {
        return self._cartItem
    }
}
