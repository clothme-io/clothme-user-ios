//
//  EditReviewDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct EditProductReviewDTO : RequestDataAble {
    let reviewData: String
    let reviewText: String
    let star: Double
    let date: String
}
