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
        
    }
    
    static func toDataModel(model: Review) -> ReviewApplicationModel {
        return ReviewApplicationModel(
            reviewId: <#T##String#>,
            productId: <#T##ProductId#>,
            reviewText: <#T##String#>,
            reviewCount: model.,
            star: model.getStar().star,
            reviewDate: model.getReviewDate().date,
            reviewer: ReviewerApplicationModel(
                reviewerId: <#T##String#>,
                reviewerName: <#T##String#>,
                reviewerProfileUrl: <#T##String#>,
                reviewerCity: <#T##String#>),
            modifiedDate: model.getModifiedDate().date
        )
    }
    
}
