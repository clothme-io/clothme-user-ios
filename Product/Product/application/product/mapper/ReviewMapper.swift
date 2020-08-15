//
//  ReviewDomainMap.swift
//  Product
//
//  Created by MACPRO on 2020-05-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class ReviewMapper {
    
    static func toDomainModel(data: ReviewApplicationModel) -> ResultOption<Review, AppError> {
        let reviewId = ReviewId.create(id: Guid(value: data.reviewId)).OptionalData().value
        guard let reviewIdValue = reviewId else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let productId = ProductId.create(id: Guid(value: data.productId)).OptionalData().value
        guard let productIdValue = productId else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let reviewText = ReviewText.create(with: data.reviewText).OptionalData().value
        guard let reviewTextValue = reviewText else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let star = Star.create(with: data.star).OptionalData().value
        guard let starValue = star else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let reviewDate = ReviewDate.create(with: data.reviewDate).OptionalData().value
        guard let reviewDateValue = reviewDate else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let modifiedDate = ModifiedDate.create(with: data.modifiedDate).OptionalData().value
        guard let modifiedDateValue = modifiedDate else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let reviewer = Reviewer.create(
            reviewerId: data.reviewer.reviewerId,
            reviewerName: data.reviewer.reviewerName,
            reviewerProfilePhoto: data.reviewer.reviewerProfileUrl,
            reviewerCity: data.reviewer.reviewerCity).OptionalData().value
        guard let reviewerValue = reviewer else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let review = Review.create(
            reviewId: reviewIdValue,
            productId: productIdValue,
            reviewText: reviewTextValue,
            star: starValue,
            reviewDate: reviewDateValue,
            modifiedDate: modifiedDateValue,
            reviewer: reviewerValue
            ).OptionalData().value
        
        guard let reviewValue = review else {
            return .error(AppError.sameValueNotAllowed)
        }
        
        return .ok(reviewValue)
    }
    
    
    static func toDataModel(model: Review) -> ReviewApplicationModel {
        return ReviewApplicationModel(
            reviewId: model.getReviewId().value().toIdString(),
            productId: model.getProductId().value().toIdString(),
            reviewText: model.getReviewText().text,
            star: model.getStar().star,
            reviewDate: model.getReviewDate().date,
            modifiedDate: model.getModifiedDate().date,
            reviewer: ReviewerApplicationModel(
                reviewerId: model.getReviewer().reviewerId,
                reviewerName: model.getReviewer().reviewerName,
                reviewerProfileUrl: model.getReviewer().reviewerProfilePhoto,
                reviewerCity: model.getReviewer().reviewerCity)
        )
    }
    
}
