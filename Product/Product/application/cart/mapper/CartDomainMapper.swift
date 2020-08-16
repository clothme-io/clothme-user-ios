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
        var index = 0
        var cartitems = [CartItem]()
        while data.cartItem.count > index {
            let productId = ProductId.create(id: Guid(value: data.cartItem[index]?.productId ?? "")).OptionalData().value!
            let productImage = ProductImage.create(images: data.cartItem[index]?.productImage ?? [""]).OptionalData().value!
            let productName = ProductName.create(with: data.cartItem[index]?.productName ?? "").OptionalData().value!
            let productDescription = ProductDescription.create(with: data.cartItem[index]?.productDescription ?? "").OptionalData().value!
            let productPrice = ProductPrice.create(
                input: Money.create(
                    currency: data.cartItem[index]?.productPrice.currency ?? "",
                    value: data.cartItem[index]?.productPrice.amount ?? 0.0).OptionalData().value!
            ).OptionalData().value!
            let productDiscount = ProductDiscount.create(with: data.cartItem[index]?.productDiscount ?? 0.0).OptionalData().value!
            let productTax = ProductTax.create(with: data.cartItem[index]?.productTax ?? 0.0).OptionalData().value!
            let itemCount = ItemCount.create(with: data.cartItem[index]?.itemCount ?? 0).OptionalData().value!
            let dateAdded = DateAdded.create(with: data.cartItem[index]?.dateAdded ?? "").OptionalData().value!
            let modifiedDate = DateAdded.create(with: data.cartItem[index]?.modifiedDate ?? "").OptionalData().value!
            
            let cartItem = CartItem.create(
                productId: productId,
                productImage: productImage,
                productName: productName,
                productDescription: productDescription,
                productPrice: productPrice,
                productDiscount: productDiscount,
                productTax: productTax,
                itemCount: itemCount,
                dateAdded: dateAdded,
                modifiedDate: modifiedDate).OptionalData().value!
            
            cartitems.append(cartItem)
            index += 1
        }
        return cartitems
    }
    
    static func toDataModel(model: Cart) -> CartApplicationModel {
        return CartApplicationModel(
            cartId: model.getCartId().value().toIdString(),
            cartItem: cartItems(model: model),
            dateAdded: model.getCreatedDate().date
        )
    }
    
    private static func cartItems(model: Cart) -> [CartItemApplicationModel] {
        var index = 0
        var cartItems = [CartItemApplicationModel]()
        while model.getCartItem().count > index {
            let cartItem = CartItemApplicationModel(
                productId: model.getCartItem()[index].getProductId().value().toIdString(),
                productImage: model.getCartItem()[index].getProductImages().images,
                productName: model.getCartItem()[index].getProductName().name,
                productPrice: ProductPriceApplicationModel(
                    currency: model.getCartItem()[index].getProductPrice().price.getCurrency(),
                    amount: model.getCartItem()[index].getProductPrice().price.getValue()
                ),
                productDescription: model.getCartItem()[index].getProductDescription().description,
                productTax: model.getCartItem()[index].getProductTax().tax,
                productDiscount: model.getCartItem()[index].getProductDiscount().discount,
                itemCount: model.getCartItem()[index].getItemCount().count,
                dateAdded: model.getCartItem()[index].getDateAdded().date,
                modifiedDate: model.getCartItem()[index].getModifiedDate().date)
            
            cartItems.append(cartItem)
            index += 1
        }
        return cartItems
    }
}
