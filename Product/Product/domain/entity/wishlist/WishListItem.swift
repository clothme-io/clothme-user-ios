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
    private let _productDescription: ProductDescription
    private let _dateAdded: DateAdded
    
    private init(
        productId: ProductId,
        productImage: ProductImage,
        productName: ProductName,
        productPrice: ProductPrice,
        productDescription: ProductDescription,
        dateAdded: DateAdded
    ) {
        self._productId = productId
        self._productImage = productImage
        self._productName = productName
        self._productPrice = productPrice
        self._productDescription = productDescription
        self._dateAdded = dateAdded
        super.init(_id: Guid(value: productId.value().toIdString()))
    }
    
    public static func create(
        productId: ProductId,
        productImage: ProductImage,
        productName: ProductName,
        productPrice: ProductPrice,
        productDescription: ProductDescription,
        dateAdded: DateAdded
    ) -> ResultOption<WishListItem, AppError> {
        return .ok(
            WishListItem(
                productId: productId,
                productImage: productImage,
                productName: productName,
                productPrice: productPrice,
                productDescription: productDescription,
                dateAdded: dateAdded
        ))
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
    
    func getProductDescription() -> ProductDescription {
        return self._productDescription
    }
    
    func getDateAdded() -> DateAdded {
        return self._dateAdded
    }
    
}
