//
//  WishList.swift
//  Product
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class WishList: AggregateRoot {
    
    private let _wishListId: WishListId
    private let _wishListItem: [WishListItem]
    private let _dateAdded: DateAdded
    
    private init(
        wishListId: WishListId,
        wishListItem: [WishListItem],
        dateAdded: DateAdded
    ) {
        self._wishListId = wishListId
        self._wishListItem = wishListItem
        self._dateAdded = dateAdded
        super.init(_id: Guid(value: wishListId.value().toIdString()))
    }
    
    public static func create(
        wishListId: WishListId,
        wishListItem: [WishListItem],
        dateAdded: DateAdded
    ) -> ResultOption<WishList, AppError> {
        return .ok(WishList(wishListId: wishListId, wishListItem: wishListItem, dateAdded: dateAdded))
    }
    
    func getWishListId() -> WishListId {
        return self._wishListId
    }
    
    func getWishistItem() -> [WishListItem] {
        return self._wishListItem
    }
    
    func getDateAdded() -> DateAdded {
        return self._dateAdded
    }
}
