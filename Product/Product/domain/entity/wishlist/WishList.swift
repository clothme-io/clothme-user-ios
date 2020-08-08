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
    
    private init(
        wishListId: WishListId,
        wishListItem: [WishListItem]
    ) {
        self._wishListId = wishListId
        self._wishListItem = wishListItem
        super.init(_id: Guid(value: wishListId.eId.toString()))
    }
    
    func getWishListId() -> WishListId {
        return self._wishListId
    }
    
    func getWishistItem() -> [WishListItem] {
        return self._wishListItem
    }
//    public func getWishListCount() -> WishListCount? {
//        let countOrError = WishListCount.create(with: self.wishListItem.count)
//        let count = countOrError.OptionalData().value
//        return count
//    }
}
