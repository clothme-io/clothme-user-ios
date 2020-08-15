//
//  CartItem.swift
//  Product
//
//  Created by MACPRO on 2020-08-05.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class CartItem: Entity {
    
    private let _productId: ProductId
    private let _productImage: ProductImage
    private let _productName: ProductName
    private let _productDescription: ProductDescription
    private let _productPrice: ProductPrice
    private let _productDiscount: ProductDiscount
    private let _productTax: ProductTax
    private let _itemCount: ItemCount
    private let _dateAdded: DateAdded
    private let _modifiedDate: DateAdded
    
    private init(
        productId: ProductId,
        productImage: ProductImage,
        productName: ProductName,
        productDescription: ProductDescription,
        productPrice: ProductPrice,
        productDiscount: ProductDiscount,
        productTax: ProductTax,
        itemCount: ItemCount,
        dateAdded: DateAdded,
        modifiedDate: DateAdded
    ) {
        self._productId = productId
        self._productImage = productImage
        self._productName = productName
        self._productDescription = productDescription
        self._productPrice = productPrice
        self._productDiscount = productDiscount
        self._productTax = productTax
        self._itemCount = itemCount
        self._dateAdded = dateAdded
        self._modifiedDate = modifiedDate
        super.init(_id: Guid(value: productId.value().toIdString()))
    }
    
    public static func create(
        productId: ProductId,
        productImage: ProductImage,
        productName: ProductName,
        productDescription: ProductDescription,
        productPrice: ProductPrice,
        productDiscount: ProductDiscount,
        productTax: ProductTax,
        itemCount: ItemCount,
        dateAdded: DateAdded,
        modifiedDate: DateAdded
    ) -> ResultOption<CartItem, AppError> {
        return .ok(CartItem(
            productId: productId,
            productImage: productImage,
            productName: productName,
            productDescription: productDescription,
            productPrice: productPrice,
            productDiscount: productDiscount,
            productTax: productTax,
            itemCount: itemCount,
            dateAdded: dateAdded,
            modifiedDate: modifiedDate
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
    
    func getProductDiscount() -> ProductDiscount {
        return self._productDiscount
    }
    
    func getProductTax() -> ProductTax {
        return self._productTax
    }
    
    func getProductDescription() -> ProductDescription {
        return self._productDescription
    }
    
    func getItemCount() -> ItemCount {
        return self._itemCount
    }
    
    func getDateAdded() -> DateAdded {
        return self._dateAdded
    }
    
    func getModifiedDate() -> DateAdded {
        return self._modifiedDate
    }
}
