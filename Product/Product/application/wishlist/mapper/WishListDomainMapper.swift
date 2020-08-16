//
//  WishListDomainMapper.swift
//  Product
//
//  Created by MACPRO on 2020-05-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class WishListDomainMapper {
    
    static func toDomainModel(data: WishListApplicationModel) -> ResultOption<WishList, AppError> {
        let wishListId = WishListId.create(id: Guid(value: data.wishListId)).OptionalData().value!
        let wishListItem = wishListItemModel(data: data)
        let dateAdded = DateAdded.create(with: data.dateAdded).OptionalData().value!
        let wishList = WishList.create(
            wishListId: wishListId,
            wishListItem: wishListItem,
            dateAdded: dateAdded).OptionalData().value!
        
        return .ok(wishList)
    }
    
    private static func wishListItemModel(data: WishListApplicationModel) -> [WishListItem] {
        var index = 0
        var wishListItems = [WishListItem]()
        while data.wishListItem.count > index {
            let productId = ProductId.create(id: Guid(value: data.wishListItem[index]?.productId ?? "")).OptionalData().value!
            let productImage = ProductImage.create(images: data.wishListItem[index]?.productImage ?? [""]).OptionalData().value!
            let productName = ProductName.create(with: data.wishListItem[index]?.productName ?? "").OptionalData().value!
            let productPrice = ProductPrice.create(
                input: Money.create(
                    currency: data.wishListItem[index]?.productPrice.currency ?? "",
                    value: data.wishListItem[index]?.productPrice.amount ?? 0.0).OptionalData().value!
                ).OptionalData().value!
            let productDescription = ProductDescription.create(with: data.wishListItem[index]?.productDescription ?? "").OptionalData().value!
            let dateAdded = DateAdded.create(with: data.wishListItem[index]?.dateAdded ?? "").OptionalData().value!
            
            let wishListItem = WishListItem.create(
                productId: productId,
                productImage: productImage,
                productName: productName,
                productPrice: productPrice,
                productDescription: productDescription,
                dateAdded: dateAdded
                ).OptionalData().value!
            
            wishListItems.append(wishListItem)
            index += 1
        }
        return wishListItems
    }
    
    static func toDataModel(model: WishList) -> WishListApplicationModel {
        return WishListApplicationModel(
            wishListId: model.getWishListId().value().toIdString(),
            wishListItem: wishListItemsData(model: model),
            dateAdded: model.getDateAdded().date
        )
    }
    
    private static func wishListItemsData(model: WishList) -> [WishListItemApplicationModel] {
        var index = 0
        var wishListItems = [WishListItemApplicationModel]()
        while model.getWishistItem().count > index {
            let wishListItem = WishListItemApplicationModel(
                productId: model.getWishistItem()[index].getProductId().value().toIdString(),
                productImage: model.getWishistItem()[index].getProductImages().images,
                productName: model.getWishistItem()[index].getProductName().name,
                productPrice: ProductPriceApplicationModel(
                    currency: model.getWishistItem()[index].getProductPrice().price.getCurrency(),
                    amount: model.getWishistItem()[index].getProductPrice().price.getValue()
                ),
                productDescription: model.getWishistItem()[index].getProductDescription().description,
                dateAdded: model.getWishistItem()[index].getDateAdded().date)
            
            wishListItems.append(wishListItem)
            index += 1
        }
        return wishListItems
    }
}
