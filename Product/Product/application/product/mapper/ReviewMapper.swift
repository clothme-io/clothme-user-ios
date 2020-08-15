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
        return ReviewApplicationModel(reviewId: <#T##String#>, productId: <#T##ProductId#>, reviewText: <#T##String#>, reviewCount: <#T##String#>, star: <#T##Double#>, reviewDate: <#T##String#>, modifiedDate: <#T##String#>)
    }
    
}
