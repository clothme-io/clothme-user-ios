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
    let productId: ProductId
    let reviewText: String
    let reviewCount: String
    let star: Double
    let reviewDate: String
    let modifiedDate: String
}
