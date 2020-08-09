//
//  WishListItem.swift
//  Product
//
//  Created by MACPRO on 2020-08-08.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class WishListItem: Entity {
    
    private let _productId: ProductId
    private let _productImage: ProductImage
    private let _productName: ProductName
    private let _productPrice: ProductPrice
    
    private init(
        productId: ProductId,
        productImage: ProductImage,
        productName: ProductName,
        productPrice: ProductPrice
    ) {
        self._productId = productId
        self._productImage = productImage
        self._productName = productName
        self._productPrice = productPrice
        super.init(_id: Guid(value: productId.value().toString()))
    }
    
    func getProductId() -> ProductId {
        return self._productId
    }
    
    func getProductImages() -> ProductImage {
        return self._productImage
    }
    
    func getProductName() -> ProductName {
        return self._productName
    }
    
    func getProductPrice() -> ProductPrice {
        return self._productPrice
    }
    
}
