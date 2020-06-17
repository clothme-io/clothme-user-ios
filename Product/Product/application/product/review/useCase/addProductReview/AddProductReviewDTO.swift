//
//  AddReviewDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct AddProductReviewDTO : RequestDataAble {
    let reviewId: String
    let reviewText: String
    let star: Double
}
