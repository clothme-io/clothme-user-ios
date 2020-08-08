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
    private let _productName: ProductName
    private let _productPrice: ProductPrice
    private let _productDiscount: ProductDiscount
    private let _productTax: ProductTax
    
    private init(
        productId: ProductId,
        productName: ProductName,
        productPrice: ProductPrice,
        productDiscount: ProductDiscount,
        productTax: ProductTax
    ) {
        self._productId = productId
        self._productName = productName
        self._productPrice = productPrice
        self._productDiscount = productDiscount
        self._productTax = productTax
        super.init(_id: Guid(value: productId.eId.toString()))
    }
    
    func getPrice() -> ProductPrice {
        return self._productPrice
    }
}
