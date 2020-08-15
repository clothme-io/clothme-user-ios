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
        guard let productIdValue = productId else { return .error(AppError.emptyValueNotAllowed) }
        
        let productName = ProductName.create(with: data.productName).OptionalData().value
        guard let productNameValue = productName else { return .error(AppError.emptyValueNotAllowed) }
        
        let productDescription = ProductDescription.create(with: data.productDescription).OptionalData().value
        guard let productDescriptionValue = productDescription else { return .error(AppError.emptyValueNotAllowed) }
        
        let productPrice = ProductPrice.create(
            with: ProductPriceApplicationModel(amount: <#T##Double#>, currency: <#T##CurrencyApplicationModel#>)).OptionalData().value
        guard let productPriceValue = productPrice else { return .error(AppError.emptyValueNotAllowed) }
        
        let productGender = ProductGender.create(with: data.productGender).OptionalData().value
        guard let productGenderValue = productGender else { return .error(AppError.emptyValueNotAllowed) }
        
        let productCategory = ProductCategory.create(with: data.productCategory).OptionalData().value
        guard let productCategoryValue = productCategory else { return .error(AppError.emptyValueNotAllowed) }
        
        let productCategoryType = ProductCategoryType.create(with: data.productCategoryType).OptionalData().value
        guard let productCategoryTypeValue = productCategoryType else { return .error(AppError.emptyValueNotAllowed) }
        
        let productDiscount = ProductDiscount.create(with: data.productDiscount).OptionalData().value
        guard let productDiscountValue = productDiscount else { return .error(AppError.emptyValueNotAllowed) }
        
        let productReturns = ReturnPolicy.create(with: data.productReturns).OptionalData().value
        guard let productReturnsValue = productReturns else { return .error(AppError.emptyValueNotAllowed) }
        
        let productDelivery = DeliveryPolicy.create(with: data.productDelivery).OptionalData().value
        guard let productDeliveryValue = productDelivery else { return .error(AppError.emptyValueNotAllowed) }
        
        let productResult = Product.create(
            productId: productIdValue,
            productName: productNameValue,
            productDescription: productDescriptionValue,
            productPrice: productPriceValue,
            productGender: productGenderValue,
            productCategory: productCategoryValue,
            productCategoryType: productCategoryTypeValue,
            productDiscount: productDiscountValue,
            productReturns: productReturnsValue,
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
