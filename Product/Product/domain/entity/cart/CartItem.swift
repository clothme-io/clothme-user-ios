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
    private let _productPrice: ProductPrice
    private let _productDiscount: ProductDiscount
    private let _productTax: ProductTax
    
    private init(
        productId: ProductId,
        productImage: ProductImage,
        productName: ProductName,
        productPrice: ProductPrice,
        productDiscount: ProductDiscount,
        productTax: ProductTax
    ) {
        self._productId = productId
        self._productImage = productImage
        self._productName = productName
        self._productPrice = productPrice
        self._productDiscount = productDiscount
        self._productTax = productTax
        super.init(_id: Guid(value: productId.value().toIdString()))
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
}
