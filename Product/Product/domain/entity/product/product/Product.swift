//
//  Product.swift
//  Product
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class Product: AggregateRoot {
    
    private let _productId: ProductId
    private let _productName: ProductName
    private let _productDescription: ProductDescription
    private let _productPrice: ProductPrice
    private let _productGender: ProductGender
    private let _productCategory: ProductCategory
    private let _productCategoryType: ProductCategoryType
    private let _productDiscount: ProductDiscount
    private let _productReturns: ReturnPolicy
    private let _productDelivery: DeliveryPolicy
    
    private init(
        productId: ProductId,
        productName: ProductName,
        productDescription: ProductDescription,
        productPrice: ProductPrice,
        productGender: ProductGender,
        productCategory: ProductCategory,
        productCategoryType: ProductCategoryType,
        productDiscount: ProductDiscount,
        productReturns: ReturnPolicy,
        productDelivery: DeliveryPolicy
    ) {
        self._productId = productId
        self._productName = productName
        self._productDescription = productDescription
        self._productPrice = productPrice
        self._productGender = productGender
        self._productCategory = productCategory
        self._productCategoryType = productCategoryType
        self._productDiscount = productDiscount
        self._productReturns = productReturns
        self._productDelivery = productDelivery
        super.init(_id: Guid(value: productId.value().toIdString()))
    }
    
    public static func create(
        productId: ProductId,
        productName: ProductName,
        productDescription: ProductDescription,
        productPrice: ProductPrice,
        productGender: ProductGender,
        productCategory: ProductCategory,
        productCategoryType: ProductCategoryType,
        productDiscount: ProductDiscount,
        productReturns: ReturnPolicy,
        productDelivery: DeliveryPolicy
    ) -> ResultOption<Product, AppError> {
        return .ok(Product(productId: productId, productName: productName, productDescription: productDescription, productPrice: productPrice, productGender: productGender, productCategory: productCategory, productCategoryType: productCategoryType, productDiscount: productDiscount, productReturns: productReturns, productDelivery: productDelivery))
    }
    
    func getProductId() -> ProductId {
        return self._productId
    }
    
    func getProductName() -> ProductName {
        return self._productName
    }
    
    func getProductDescription() -> ProductDescription {
        return self._productDescription
    }
    
    func getProductPrice() -> ProductPrice {
        return self._productPrice
    }
    
    func getProductGender() -> ProductGender {
        return self._productGender
    }
    
    func getProductCategory() -> ProductCategory {
        return self._productCategory
    }
    
    func getProductCategoryType() -> ProductCategoryType {
        return self._productCategoryType
    }
    
    func getProductDiscount() -> ProductDiscount {
        return self._productDiscount
    }
    
    func getProductReturns() -> ReturnPolicy {
        return self._productReturns
    }
    
    func getProductDelivery() -> DeliveryPolicy {
        return self._productDelivery
    }
    
}
