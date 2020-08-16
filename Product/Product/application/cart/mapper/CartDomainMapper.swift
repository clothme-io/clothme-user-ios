//
//  CartDomainMapper.swift
//  Product
//
//  Created by MACPRO on 2020-05-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class CartDomainMapper {
    
    static func toDomainModel(data: CartApplicationModel) -> ResultOption<Cart, AppError> {
        let cartId = CartId.create(id: Guid(value: data.cartId)).OptionalData().value
        guard let cartIdValue = cartId else { return .error(AppError.emptyData) }
        let cartItem = cartModelItems(data: data)
        let createdDate = DateAdded.create(with: data.dateAdded).OptionalData().value
        guard let createdDateValue = createdDate else { return .error(AppError.emptyData) }
        
        return Cart.create(
            cartId: cartIdValue,
            cartItem: cartItem,
            createdDate: createdDateValue
        )
    }
    
    private static func cartModelItems(data: CartApplicationModel) -> [CartItem] {
        
    }
    
    static func toDataModel(model: Cart) -> CartApplicationModel {
        return CartApplicationModel(
            cartId: model.getCartId().value().toIdString(),
            cartItem: cartItems(model: model),
            dateAdded: model.getCreatedDate().date
        )
    }
    
    private static func cartItems(model: Cart) -> [CartItemApplicationModel] {
        
    }
}
