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
        
    }
    
    static func toDataModel(model: WishList) -> WishListApplicationModel {
        return WishListApplicationModel(
            wishListId: model.getWishListId().value().toIdString(),
            wishListItem: wishListItemsData(model: model),
            dateAdded: model.getDateAdded().date
        )
    }
    
    private static func wishListItemsData(model: WishList) -> [WishListItemApplicationModel] {
        
    }
}
