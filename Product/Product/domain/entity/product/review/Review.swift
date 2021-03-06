//
//  Review.swift
//  Product
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class Review: Entity {
    
    private let _reviewId: ReviewId
    private let _productId: ProductId
    private let _reviewText: ReviewText
    private let _star: Star
    private let _reviewDate: ReviewDate
    private let _modifiedDate: ModifiedDate
    private let _reviewer: Reviewer
    
    private init(
        reviewId: ReviewId,
        productId: ProductId,
        reviewText: ReviewText,
        star: Star,
        reviewDate: ReviewDate,
        modifiedDate: ModifiedDate,
        reviewer: Reviewer
    ) {
        self._reviewId = reviewId
        self._productId = productId
        self._reviewText = reviewText
        self._star = star
        self._reviewDate = reviewDate
        self._modifiedDate = modifiedDate
        self._reviewer = reviewer
        super.init(_id: Guid(value: reviewId.value().toIdString()))
    }
    
    static func create(
        reviewId: ReviewId,
        productId: ProductId,
        reviewText: ReviewText,
        star: Star,
        reviewDate: ReviewDate,
        modifiedDate: ModifiedDate,
        reviewer: Reviewer
    ) -> ResultOption<Review, AppError> {
        return .ok(Review(
                reviewId: reviewId,
                productId: productId,
                reviewText: reviewText,
                star: star,
                reviewDate: reviewDate,
                modifiedDate: modifiedDate,
                reviewer: reviewer
        ))
    }
    
    func getReviewId() -> ReviewId {
        return self._reviewId
    }
    
    func getProductId() -> ProductId {
        return self._productId
    }
    
    func getReviewText() -> ReviewText {
        return self._reviewText
    }
    
    func getStar() -> Star {
        return self._star
    }
    
    func getReviewDate() -> ReviewDate {
        return self._reviewDate
    }
    
    func getModifiedDate() -> ModifiedDate {
        return self._modifiedDate
    }
    
    
    func getReviewer() -> Reviewer {
        return self._reviewer
    }
}
