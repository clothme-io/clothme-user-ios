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
    private let _createdDate: DateAdded
    
    private init(
        cartId: CartId,
        cartItem: [CartItem],
        createdDate: DateAdded
    ) {
        self._cartId = cartId
        self._cartItem = cartItem
        self._createdDate = createdDate
        super.init(_id: Guid(value: cartId.value().toIdString()))
    }
    
    static func create(
        cartId: CartId,
        cartItem: [CartItem],
        createdDate: DateAdded
    ) -> ResultOption<Cart, AppError> {
        return .ok(Cart(
            cartId: cartId,
            cartItem: cartItem,
            createdDate: createdDate
        ))
    }
    
    func getCartId() -> CartId {
        return self._cartId
    }
    
    func getCartItem() -> [CartItem] {
        return self._cartItem
    }
    
    func getCreatedDate() -> DateAdded {
        return self._createdDate
    }
}
