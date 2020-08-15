//
//  ProductMap.swift
//  Product
//
//  Created by MACPRO on 2020-05-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class ProductMapper {
    
    static func toDomainModel(data: ProductApplicationModel) -> ResultOption<Product, AppError> {
        let productId = ProductId.create(id: Guid(value: data.productId)).OptionalData().value
        let productName = ProductName.create(with: data.productName).OptionalData().value
        let productDescription = ProductDescription.create(with: data.productDescription).OptionalData().value
        let productPrice = ProductPrice.create(with: data.productPrice).OptionalData().value
        let productGender = ProductGender.create(with: data.productGender).OptionalData().value
        let productCategory = ProductCategory.create(with: data.productCategory).OptionalData().value
        let productCategoryType = ProductCategoryType.create(with: data.productCategoryType).OptionalData().value
        let productDiscount = ProductDiscount.create(with: data.productDiscount).OptionalData().value
        let productReturns = ReturnPolicy.create(with: data.productReturns).OptionalData().value
        let productDelivery = DeliveryPolicy.create(with: data.productDelivery).OptionalData().value
        
        let productResult = Product.create(
            productId: <#T##ProductId#>,
            productName: <#T##ProductName#>,
            productDescription: <#T##ProductDescription#>,
            productPrice: <#T##ProductPrice#>,
            productGender: <#T##ProductGender#>,
            productCategory: <#T##ProductCategory#>,
            productCategoryType: <#T##ProductCategoryType#>,
            productDiscount: <#T##ProductDiscount#>,
            productReturns: <#T##ReturnPolicy#>,
            productDelivery: productDelivery?.policy
        ).OptionalData().value
        guard let product = productResult else {
            return .error(AppError.userDoesNotExist)
        }
        
        return .ok(product)
    }
    
    static func toDataModel(model: Product) -> ProductApplicationModel {
        return ProductApplicationModel(
            productId: model.getProductId().value().toIdString(),
            productName: model.getProductName().name,
            productDescription: model.getProductDescription().description,
            productPrice: model.getProductPrice().price,
            productGender: model.getProductGender().gender,
            productCategory: model.getProductCategory().category,
            productCategoryType: model.getProductCategoryType().categoryType,
            productDiscount: model.getProductDiscount().discount,
            productReturns: model.getProductReturns().policy,
            productDelivery: model.getProductDelivery().policy,
            companyId: model, brandId: <#T##String#>, locationId: <#T##String#>)
    }
}
