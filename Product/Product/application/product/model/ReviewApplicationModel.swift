//
//  ReviewDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct ReviewApplicationModel : RequestDataAble {
    let reviewId: String
    let productId: String
    let reviewText: String
    let star: Double
    let reviewDate: String
    let modifiedDate: String
    let reviewer: ReviewerApplicationModel
}


struct ReviewerApplicationModel : RequestDataAble {
    let reviewerId: String
    let reviewerName: String
    let reviewerProfileUrl: String
    let reviewerCity: String
}
