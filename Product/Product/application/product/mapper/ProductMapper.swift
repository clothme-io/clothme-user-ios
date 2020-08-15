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
        
        let productPrice = ProductPrice.create(input:
            Money.create(
                currency: data.productPrice.currency,
                value: data.productPrice.amount
            ).OptionalData().value!
            ).OptionalData().value
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
        
        let like = Like.create(
            likeId: LikeId.create(id: Guid(value: data.like.likeId)).OptionalData().value!,
            productId: ProductId.create(id: Guid(value: data.like.productId)).OptionalData().value!,
            likeCount: LikeCount.create(with: data.like.likeCount).OptionalData().value!
            ).OptionalData().value
        guard let likeValue = like else { return .error(AppError.emptyValueNotAllowed) }
        
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
            productDelivery: productDeliveryValue,
            like: likeValue,
            review: reviewModel(data: data)
        ).OptionalData().value
        guard let product = productResult else {
            return .error(AppError.userDoesNotExist)
        }
        
        return .ok(product)
    }
    
    private static func reviewModel(data: ProductApplicationModel) -> [Review] {
        var index = 0
        var reviews = [Review]()
        while data.review.count > index {
            let reviewId = ReviewId.create(id: Guid(value: data.review[index]?.reviewId ?? "")).OptionalData().value!
            let productId = ProductId.create(id: Guid(value: data.review[index]?.productId ?? "")).OptionalData().value!
            let reviewText = ReviewText.create(with: data.review[index]?.reviewText ?? "").OptionalData().value!
            let star = Star.create(with: data.review[index]?.star ?? 0.0 ).OptionalData().value!
            let reviewDate = ReviewDate.create(with: data.review[index]?.reviewDate ?? "").OptionalData().value!
            let modifiedDate = ModifiedDate.create(with: data.review[index]?.modifiedDate ?? "").OptionalData().value!
            let reviewer = Reviewer.create(
                reviewerId: data.review[index]?.reviewer.reviewerId ?? "",
                reviewerName: data.review[index]?.reviewer.reviewerName ?? "",
                reviewerProfilePhoto: data.review[index]?.reviewer.reviewerProfileUrl ?? "",
                reviewerCity: data.review[index]?.reviewer.reviewerCity ?? ""
            ).OptionalData().value!
            
            let review = Review.create(
                reviewId: reviewId,
                productId: productId,
                reviewText: reviewText,
                star: star,
                reviewDate: reviewDate,
                modifiedDate: modifiedDate,
                reviewer: reviewer
                ).OptionalData().value!
            
            reviews.append(review)
            index += 1
        }
        return reviews
    }
    
    static func toDataModel(model: Product) -> ProductApplicationModel {
        return ProductApplicationModel(
            productId: model.getProductId().value().toIdString(),
            productName: model.getProductName().name,
            productDescription: model.getProductDescription().description,
            productPrice: ProductPriceApplicationModel(
                currency: model.getProductPrice().price.getCurrency(),
                amount: model.getProductPrice().price.getValue()
            ),
            productGender: model.getProductGender().gender,
            productCategory: model.getProductCategory().category,
            productCategoryType: model.getProductCategoryType().categoryType,
            productDiscount: model.getProductDiscount().discount,
            productReturns: model.getProductReturns().policy,
            productDelivery: model.getProductDelivery().policy,
            like: LikeApplicationModel(
                likeId: model.getLike().likeId().value().toIdString(),
                productId: model.getLike().productId().value().toIdString(),
                likeCount: model.getLike().likeCount().count
            ),
            review: reviewApplication(model: model)
        )
    }
    
    private static func reviewApplication(model: Product) -> [ReviewApplicationModel] {
        var index = 0
        var reviews = [ReviewApplicationModel]()
        while model.getReview().count > index {
            let review = ReviewApplicationModel(
                reviewId: model.getReview()[index].getReviewId().value().toIdString(),
                productId: model.getReview()[index].getProductId().value().toIdString(),
                reviewText: model.getReview()[index].getReviewText().text,
                star: model.getReview()[index].getStar().star,
                reviewDate: model.getReview()[index].getReviewDate().date,
                modifiedDate: model.getReview()[index].getModifiedDate().date,
                reviewer: ReviewerApplicationModel(
                    reviewerId: model.getReview()[index].getReviewer().reviewerId,
                    reviewerName: model.getReview()[index].getReviewer().reviewerName,
                    reviewerProfileUrl: model.getReview()[index].getReviewer().reviewerProfilePhoto,
                    reviewerCity: model.getReview()[index].getReviewer().reviewerCity)
            )
            reviews.append(review)
            index += 1
        }
        return reviews
    }
}
